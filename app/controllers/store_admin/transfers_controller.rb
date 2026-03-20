class StoreAdmin::TransfersController < StoreAdmin::ApplicationController
  before_action :ensure_transfer_access
  before_action :set_transfer, only: [:show, :cancel]

  def index
    @transfers = StoreInventoryTransfer.for_store(@current_store.id)
                                       .recent
                                       .includes(:product, :from_store, :to_store, :initiated_by)

    # Filter by status
    if params[:status].present?
      @transfers = @transfers.where(status: params[:status])
    end

    # Filter by direction
    case params[:direction]
    when 'incoming'
      @transfers = @transfers.incoming(@current_store.id)
    when 'outgoing'
      @transfers = @transfers.outgoing(@current_store.id)
    end

    @transfers = @transfers.page(params[:page]).per(15)

    @summary = calculate_transfer_summary
  end

  def show
    @transfer_direction = @transfer.transfer_direction_for_store(@current_store)
    @can_cancel = can_cancel_transfer?(@transfer)
  end

  def new
    @transfer = StoreInventoryTransfer.new
    @products = @current_store.store_products_with_inventory.includes(:category)
    @other_stores = Store.where.not(id: @current_store.id).active

    # If product_id is passed, pre-select the product
    if params[:product_id].present?
      @selected_product = @products.find_by(id: params[:product_id])
      @available_quantity = @current_store.available_inventory(@selected_product.id) if @selected_product
    end
  end

  def create
    @transfer = StoreInventoryTransfer.new(transfer_params)
    @transfer.initiated_by = current_user
    @transfer.initiated_at = Time.current

    # Determine source store
    if params[:transfer_type] == 'outgoing'
      @transfer.from_store = @current_store
    elsif params[:transfer_type] == 'incoming'
      @transfer.to_store = @current_store
    end

    # Validate inventory availability for outgoing transfers
    if @transfer.from_store == @current_store
      available = @current_store.available_inventory(@transfer.product_id)
      if @transfer.quantity > available
        @transfer.errors.add(:quantity, "only #{available} units available in store")
        render_new_form
        return
      end
    end

    if @transfer.save
      # Send notification to destination store admin or super admin
      send_transfer_request_notification(@transfer)

      redirect_to store_admin_transfer_path(@transfer),
                  notice: 'Transfer request created successfully and sent for approval'
    else
      render_new_form
    end
  end

  def cancel
    if @transfer.can_be_cancelled?
      reason = params[:cancellation_reason] || 'Cancelled by store admin'

      if @transfer.cancel_transfer!(reason)
        redirect_to store_admin_transfers_path,
                    notice: 'Transfer request cancelled successfully'
      else
        redirect_to store_admin_transfer_path(@transfer),
                    alert: 'Failed to cancel transfer request'
      end
    else
      redirect_to store_admin_transfer_path(@transfer),
                  alert: 'Transfer cannot be cancelled at this stage'
    end
  end

  def receive
    @transfer = @current_store.incoming_transfers.find(params[:id])

    if @transfer.in_transit?
      if @transfer.complete_transfer!
        redirect_to store_admin_transfer_path(@transfer),
                    notice: 'Transfer received and inventory updated successfully'
      else
        redirect_to store_admin_transfer_path(@transfer),
                    alert: 'Failed to complete transfer'
      end
    else
      redirect_to store_admin_transfer_path(@transfer),
                  alert: 'Transfer is not ready to be received'
    end
  end

  def check_availability
    product_id = params[:product_id]
    quantity = params[:quantity].to_f

    if product_id.present? && quantity > 0
      available = @current_store.available_inventory(product_id)
      product = Product.find(product_id)

      render json: {
        available: available,
        sufficient: available >= quantity,
        shortage: available < quantity ? (quantity - available) : 0,
        product_name: product.name
      }
    else
      render json: { error: 'Invalid parameters' }, status: :bad_request
    end
  end

  private

  def ensure_transfer_access
    unless current_user.can_request_transfers?
      redirect_to store_admin_root_path, alert: 'Access denied. Transfer management permission required.'
    end
  end

  def set_transfer
    @transfer = StoreInventoryTransfer.for_store(@current_store.id).find(params[:id])
  end

  def transfer_params
    params.require(:store_inventory_transfer).permit(
      :product_id, :to_store_id, :from_store_id, :quantity, :transfer_price, :notes
    )
  end

  def render_new_form
    @products = @current_store.store_products_with_inventory.includes(:category)
    @other_stores = Store.where.not(id: @current_store.id).active
    render :new, status: :unprocessable_entity
  end

  def can_cancel_transfer?(transfer)
    return false unless transfer.can_be_cancelled?

    # Store admin can cancel transfers they initiated or are receiving
    transfer.initiated_by == current_user ||
      (transfer.from_store == @current_store && current_user.can_request_transfers?) ||
      (transfer.to_store == @current_store && current_user.can_request_transfers?)
  end

  def calculate_transfer_summary
    base_query = StoreInventoryTransfer.for_store(@current_store.id)

    {
      total_transfers: base_query.count,
      pending_approvals: base_query.pending.count,
      in_transit: base_query.in_transit.count,
      completed_this_month: base_query.completed
                                      .where(completed_at: Date.current.beginning_of_month..Date.current.end_of_day)
                                      .count,
      incoming_pending: @current_store.incoming_transfers.pending.count,
      outgoing_pending: @current_store.outgoing_transfers.pending.count
    }
  end

  def send_transfer_request_notification(transfer)
    # This would typically send email or system notifications
    # For now, just log the action
    Rails.logger.info "Transfer request #{transfer.transfer_reference_number} created by #{current_user.full_name}"

    # Find admins to notify
    if transfer.to_store.store_admin_user
      # Notify destination store admin
      Rails.logger.info "Notify store admin: #{transfer.to_store.store_admin_user.email}"
    end

    # Notify super admins for approval
    super_admins = User.joins(:role).where(roles: { name: 'super_admin' })
    super_admins.each do |admin|
      Rails.logger.info "Notify super admin: #{admin.email}"
    end
  end
end