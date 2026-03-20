class StoreAdmin::BookingsController < StoreAdmin::ApplicationController
  before_action :ensure_bookings_access
  before_action :set_booking, only: [:show, :edit, :update, :update_status, :cancel]

  def index
    @bookings = @current_store.bookings.recent.includes(:customer, :booking_items => :product)

    # Filter by status
    if params[:status].present?
      @bookings = @bookings.where(status: params[:status])
    end

    # Search functionality
    if params[:search].present?
      @bookings = @bookings.joins(:customer)
                          .where('customers.first_name ILIKE ? OR customers.last_name ILIKE ? OR bookings.booking_number ILIKE ?',
                                "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # Date filter
    if params[:date_from].present? && params[:date_to].present?
      @bookings = @bookings.where(created_at: params[:date_from].to_date..params[:date_to].to_date.end_of_day)
    end

    @bookings = @bookings.page(params[:page]).per(20)

    # Summary stats
    @summary = calculate_bookings_summary
  end

  def show
    @can_update_status = can_update_booking_status?(@booking)
    @available_statuses = @booking.next_possible_statuses
  end

  def new
    @booking = @current_store.bookings.build
    @available_products = @current_store.store_products_with_inventory.includes(:category)
    @customers = Customer.active.order(:first_name)
  end

  def create
    @booking = @current_store.bookings.build(booking_params)
    @booking.user = current_user

    if validate_inventory_availability && @booking.save
      redirect_to store_admin_booking_path(@booking), notice: 'Booking created successfully'
    else
      @available_products = @current_store.store_products_with_inventory.includes(:category)
      @customers = Customer.active.order(:first_name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @available_products = @current_store.store_products_with_inventory.includes(:category)
    @customers = Customer.active.order(:first_name)
  end

  def update
    old_items = @booking.booking_items.to_a

    if validate_inventory_availability && @booking.update(booking_params)
      redirect_to store_admin_booking_path(@booking), notice: 'Booking updated successfully'
    else
      @available_products = @current_store.store_products_with_inventory.includes(:category)
      @customers = Customer.active.order(:first_name)
      render :edit, status: :unprocessable_entity
    end
  end

  def update_status
    new_status = params[:new_status]

    unless @booking.next_possible_statuses.include?(new_status)
      redirect_to store_admin_booking_path(@booking), alert: 'Invalid status transition'
      return
    end

    case new_status
    when 'confirmed'
      result = @booking.mark_as_confirmed!
    when 'processing'
      result = @booking.mark_as_processing!
    when 'packed'
      result = @booking.mark_as_packed!
    when 'shipped'
      result = @booking.mark_as_shipped!(params[:tracking_number])
    when 'out_for_delivery'
      result = @booking.mark_as_out_for_delivery!
    when 'delivered'
      result = @booking.mark_as_delivered!
    when 'completed'
      result = @booking.mark_as_completed!
    else
      result = false
    end

    if result
      redirect_to store_admin_booking_path(@booking), notice: "Booking status updated to #{new_status.humanize}"
    else
      redirect_to store_admin_booking_path(@booking), alert: 'Failed to update booking status'
    end
  end

  def cancel
    reason = params[:cancellation_reason]

    if @booking.cancel_order!(reason)
      redirect_to store_admin_bookings_path, notice: 'Booking cancelled successfully'
    else
      redirect_to store_admin_booking_path(@booking), alert: 'Failed to cancel booking'
    end
  end

  def daily_summary
    date = params[:date]&.to_date || Date.current
    @selected_date = date

    @bookings = @current_store.bookings
                              .where(created_at: date.beginning_of_day..date.end_of_day)
                              .includes(:customer, :booking_items => :product)

    @summary = {
      total_bookings: @bookings.count,
      total_revenue: @bookings.where.not(status: ['cancelled', 'returned']).sum(:total_amount),
      confirmed_bookings: @bookings.where(status: 'confirmed').count,
      delivered_bookings: @bookings.where(status: 'delivered').count,
      cancelled_bookings: @bookings.where(status: 'cancelled').count
    }
  end

  private

  def ensure_bookings_access
    unless current_user.can_create_bookings?
      redirect_to store_admin_root_path, alert: 'Access denied. Booking management permission required.'
    end
  end

  def set_booking
    @booking = @current_store.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(
      :customer_id, :notes, :payment_method, :payment_status, :discount_amount,
      booking_items_attributes: [:id, :product_id, :quantity, :price, :_destroy]
    )
  end

  def validate_inventory_availability
    return true unless @booking.booking_items.any?

    insufficient_items = []

    @booking.booking_items.each do |item|
      next if item.marked_for_destruction?
      next unless item.product_id && item.quantity

      available = @current_store.available_inventory(item.product_id)

      # For existing items being updated, add back their previous quantity
      if item.persisted? && item.quantity_changed?
        available += (item.quantity_was || 0)
      end

      if item.quantity > available
        product_name = Product.find(item.product_id).name
        insufficient_items << "#{product_name} (need #{item.quantity}, have #{available})"
      end
    end

    if insufficient_items.any?
      @booking.errors.add(:base, "Insufficient inventory: #{insufficient_items.join(', ')}")
      return false
    end

    true
  end

  def can_update_booking_status?(booking)
    # Store admins can update status of bookings in their store
    current_user.can_create_bookings? && booking.store == @current_store
  end

  def calculate_bookings_summary
    base_query = @current_store.bookings

    {
      total_bookings: base_query.count,
      pending_bookings: base_query.where(status: ['draft', 'ordered_and_delivery_pending', 'confirmed']).count,
      processing_bookings: base_query.where(status: ['processing', 'packed', 'shipped', 'out_for_delivery']).count,
      completed_bookings: base_query.where(status: ['delivered', 'completed']).count,
      cancelled_bookings: base_query.where(status: ['cancelled', 'returned']).count,
      today_revenue: base_query.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
                               .where.not(status: ['cancelled', 'returned'])
                               .sum(:total_amount),
      month_revenue: base_query.where(created_at: Date.current.beginning_of_month..Date.current.end_of_day)
                               .where.not(status: ['cancelled', 'returned'])
                               .sum(:total_amount)
    }
  end
end