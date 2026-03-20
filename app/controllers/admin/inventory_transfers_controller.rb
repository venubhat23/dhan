class Admin::InventoryTransfersController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_access
  before_action :set_transfer, only: [:show, :approve, :reject, :cancel, :update_shipping]

  def index
    @transfers = StoreInventoryTransfer.recent
                                       .includes(:product, :from_store, :to_store, :initiated_by, :approved_by)

    # Filter by status
    if params[:status].present?
      @transfers = @transfers.where(status: params[:status])
    end

    # Filter by store
    if params[:store_id].present?
      @transfers = @transfers.where('from_store_id = ? OR to_store_id = ?', params[:store_id], params[:store_id])
    end

    # Filter by product
    if params[:product_id].present?
      @transfers = @transfers.where(product_id: params[:product_id])
    end

    # Date range filter
    if params[:date_from].present? && params[:date_to].present?
      @transfers = @transfers.where(created_at: params[:date_from].to_date..params[:date_to].to_date.end_of_day)
    end

    @transfers = @transfers.page(params[:page]).per(20)

    # Summary statistics
    @summary = calculate_transfer_summary
    @stores = Store.active.order(:name)
    @products = Product.joins(:stock_batches).distinct.order(:name)
  end

  def show
    @timeline = build_transfer_timeline(@transfer)
    @can_approve = can_approve_transfer?(@transfer)
    @can_cancel = can_cancel_transfer?(@transfer)
  end

  def new
    @transfer = StoreInventoryTransfer.new
    @products = Product.joins(:stock_batches)
                      .where(stock_batches: { status: 'active' })
                      .where('stock_batches.quantity_remaining > 0')
                      .distinct
                      .includes(:category)
    @stores = Store.active.order(:name)
  end

  def create
    @transfer = StoreInventoryTransfer.new(transfer_params)
    @transfer.initiated_by = current_user
    @transfer.initiated_at = Time.current

    if @transfer.save
      redirect_to admin_inventory_transfer_path(@transfer),
                  notice: 'Transfer created successfully'
    else
      @products = Product.joins(:stock_batches)
                        .where(stock_batches: { status: 'active' })
                        .distinct
                        .includes(:category)
      @stores = Store.active.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def approve
    if @transfer.can_be_approved?
      if @transfer.approve!(current_user)
        redirect_to admin_inventory_transfer_path(@transfer),
                    notice: 'Transfer approved and inventory allocated successfully'
      else
        redirect_to admin_inventory_transfer_path(@transfer),
                    alert: 'Failed to approve transfer. Check inventory availability.'
      end
    else
      redirect_to admin_inventory_transfer_path(@transfer),
                  alert: 'Transfer cannot be approved at this stage'
    end
  end

  def reject
    reason = params[:rejection_reason]

    if @transfer.pending?
      @transfer.update!(
        status: :rejected,
        notes: [@transfer.notes, "Rejected: #{reason}"].compact.join("\n"),
        approved_by: current_user,
        approved_at: Time.current
      )

      redirect_to admin_inventory_transfers_path,
                  notice: 'Transfer request rejected'
    else
      redirect_to admin_inventory_transfer_path(@transfer),
                  alert: 'Only pending transfers can be rejected'
    end
  end

  def cancel
    reason = params[:cancellation_reason]

    if @transfer.cancel_transfer!(reason)
      redirect_to admin_inventory_transfers_path,
                  notice: 'Transfer cancelled successfully'
    else
      redirect_to admin_inventory_transfer_path(@transfer),
                  alert: 'Failed to cancel transfer'
    end
  end

  def update_shipping
    shipping_params = params.require(:shipping).permit(:tracking_number, :courier_details, :estimated_days)

    if @transfer.approved? && @transfer.mark_as_shipped!(shipping_params)
      redirect_to admin_inventory_transfer_path(@transfer),
                  notice: 'Shipping information updated successfully'
    else
      redirect_to admin_inventory_transfer_path(@transfer),
                  alert: 'Failed to update shipping information'
    end
  end

  def bulk_approve
    transfer_ids = params[:transfer_ids]

    if transfer_ids.blank?
      redirect_to admin_inventory_transfers_path, alert: 'No transfers selected'
      return
    end

    approved_count = 0
    failed_count = 0

    StoreInventoryTransfer.where(id: transfer_ids, status: 'pending').each do |transfer|
      if transfer.can_be_approved? && transfer.approve!(current_user)
        approved_count += 1
      else
        failed_count += 1
      end
    end

    message = "#{approved_count} transfers approved successfully"
    message += ", #{failed_count} failed" if failed_count > 0

    redirect_to admin_inventory_transfers_path, notice: message
  end

  def analytics
    @date_range = params[:date_range] || '30'
    start_date = @date_range.to_i.days.ago.to_date
    end_date = Date.current

    @analytics_data = {
      transfer_trends: calculate_transfer_trends(start_date, end_date),
      store_performance: calculate_store_transfer_performance(start_date, end_date),
      product_movement: calculate_product_movement_data(start_date, end_date),
      efficiency_metrics: calculate_efficiency_metrics(start_date, end_date)
    }
  end

  private

  def ensure_admin_access
    unless current_user&.admin? || current_user&.super_admin?
      redirect_to root_path, alert: 'Access denied. Admin privileges required.'
    end
  end

  def set_transfer
    @transfer = StoreInventoryTransfer.find(params[:id])
  end

  def transfer_params
    params.require(:store_inventory_transfer).permit(
      :product_id, :from_store_id, :to_store_id, :quantity, :transfer_price, :notes
    )
  end

  def can_approve_transfer?(transfer)
    current_user.can_approve_transfers? && transfer.can_be_approved?
  end

  def can_cancel_transfer?(transfer)
    current_user.admin? && transfer.can_be_cancelled?
  end

  def calculate_transfer_summary
    {
      total_transfers: StoreInventoryTransfer.count,
      pending_approvals: StoreInventoryTransfer.pending.count,
      in_transit: StoreInventoryTransfer.in_transit.count,
      completed_today: StoreInventoryTransfer.completed
                                             .where(completed_at: Date.current.beginning_of_day..Date.current.end_of_day)
                                             .count,
      total_value_this_month: StoreInventoryTransfer.completed
                                                    .where(completed_at: Date.current.beginning_of_month..Date.current.end_of_day)
                                                    .joins(:product)
                                                    .sum('store_inventory_transfers.quantity * products.price'),
      average_completion_time: calculate_average_completion_time
    }
  end

  def calculate_average_completion_time
    completed_transfers = StoreInventoryTransfer.completed
                                                .where(completed_at: 30.days.ago..Time.current)
                                                .where.not(initiated_at: nil)

    return 0 if completed_transfers.empty?

    total_hours = completed_transfers.sum do |transfer|
      ((transfer.completed_at - transfer.initiated_at) / 1.hour).round(2)
    end

    (total_hours / completed_transfers.count).round(2)
  end

  def build_transfer_timeline(transfer)
    timeline = []

    timeline << {
      status: 'initiated',
      timestamp: transfer.initiated_at,
      user: transfer.initiated_by&.full_name,
      description: "Transfer request created"
    }

    if transfer.approved_at
      timeline << {
        status: 'approved',
        timestamp: transfer.approved_at,
        user: transfer.approved_by&.full_name,
        description: "Transfer approved and inventory allocated"
      }
    end

    if transfer.shipped_at
      timeline << {
        status: 'shipped',
        timestamp: transfer.shipped_at,
        user: transfer.approved_by&.full_name,
        description: "Transfer shipped#{transfer.tracking_number.present? ? " (#{transfer.tracking_number})" : ""}"
      }
    end

    if transfer.completed_at
      timeline << {
        status: 'completed',
        timestamp: transfer.completed_at,
        user: transfer.to_store.store_admin_user&.full_name,
        description: "Transfer completed and inventory updated"
      }
    end

    if transfer.cancelled_at
      timeline << {
        status: 'cancelled',
        timestamp: transfer.cancelled_at,
        user: transfer.approved_by&.full_name || transfer.initiated_by&.full_name,
        description: "Transfer cancelled"
      }
    end

    timeline.sort_by { |event| event[:timestamp] || Time.current }
  end

  def calculate_transfer_trends(start_date, end_date)
    # Daily transfer counts for the specified period
    (start_date..end_date).map do |date|
      {
        date: date.strftime('%Y-%m-%d'),
        initiated: StoreInventoryTransfer.where(initiated_at: date.beginning_of_day..date.end_of_day).count,
        completed: StoreInventoryTransfer.where(completed_at: date.beginning_of_day..date.end_of_day).count
      }
    end
  end

  def calculate_store_transfer_performance(start_date, end_date)
    Store.active.map do |store|
      {
        store_name: store.name,
        outgoing_transfers: store.outgoing_transfers.where(initiated_at: start_date..end_date).count,
        incoming_transfers: store.incoming_transfers.where(initiated_at: start_date..end_date).count,
        completion_rate: calculate_store_completion_rate(store, start_date, end_date)
      }
    end
  end

  def calculate_product_movement_data(start_date, end_date)
    StoreInventoryTransfer.completed
                          .where(completed_at: start_date..end_date)
                          .joins(:product)
                          .group('products.name')
                          .sum(:quantity)
                          .sort_by { |_, quantity| -quantity }
                          .first(10)
  end

  def calculate_efficiency_metrics(start_date, end_date)
    transfers_in_period = StoreInventoryTransfer.where(initiated_at: start_date..end_date)

    {
      total_transfers: transfers_in_period.count,
      completion_rate: calculate_completion_rate(transfers_in_period),
      average_approval_time: calculate_average_approval_time(transfers_in_period),
      average_transit_time: calculate_average_transit_time(transfers_in_period)
    }
  end

  def calculate_store_completion_rate(store, start_date, end_date)
    total_transfers = StoreInventoryTransfer.for_store(store.id)
                                           .where(initiated_at: start_date..end_date)
                                           .count

    return 0 if total_transfers == 0

    completed_transfers = StoreInventoryTransfer.for_store(store.id)
                                               .completed
                                               .where(initiated_at: start_date..end_date)
                                               .count

    ((completed_transfers.to_f / total_transfers) * 100).round(2)
  end

  def calculate_completion_rate(transfers)
    return 0 if transfers.empty?

    completed_count = transfers.completed.count
    ((completed_count.to_f / transfers.count) * 100).round(2)
  end

  def calculate_average_approval_time(transfers)
    approved_transfers = transfers.where.not(approved_at: nil, initiated_at: nil)
    return 0 if approved_transfers.empty?

    total_hours = approved_transfers.sum do |transfer|
      ((transfer.approved_at - transfer.initiated_at) / 1.hour).round(2)
    end

    (total_hours / approved_transfers.count).round(2)
  end

  def calculate_average_transit_time(transfers)
    completed_transfers = transfers.completed.where.not(shipped_at: nil, completed_at: nil)
    return 0 if completed_transfers.empty?

    total_hours = completed_transfers.sum do |transfer|
      ((transfer.completed_at - (transfer.shipped_at || transfer.approved_at)) / 1.hour).round(2)
    end

    (total_hours / completed_transfers.count).round(2)
  end
end