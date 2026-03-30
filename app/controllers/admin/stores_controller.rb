class Admin::StoresController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy, :toggle_status, :assign_admin, :update_admin, :inventory, :transfer_inventory, :transfer, :process_transfer, :current_stock, :summary]
  before_action :check_collect_from_store_enabled, only: [:index, :new, :create]
  skip_before_action :verify_authenticity_token, only: [:get_product_availability]

  def index
    @stores = Store.all.order(:name)
    @can_add_more = Store.can_add_more_stores?
    @remaining_slots = Store.remaining_store_slots
    @collect_from_store_enabled = SystemSetting.collect_from_store_enabled?

    respond_to do |format|
      format.html
      format.json { render json: @stores }
    end
  end

  def show
    @bookings_count = @store.bookings.count
  end

  def new
    unless Store.can_add_more_stores?
      redirect_to admin_stores_path, alert: "Maximum #{Store::MAX_STORES_LIMIT} stores allowed. Cannot add more stores."
      return
    end

    @store = Store.new
    @store.status = true # Default to active
    @store.create_admin_user = true # Default to creating admin
    @available_products = @store.available_products_for_allocation
    prepare_inventory_data
  end

  def create
    unless Store.can_add_more_stores?
      redirect_to admin_stores_path, alert: "Maximum #{Store::MAX_STORES_LIMIT} stores allowed. Cannot add more stores."
      return
    end

    @store = Store.new(store_params)

    # Handle inventory allocations
    if params[:inventory_allocations].present?
      @store.initial_inventory_allocations = params[:inventory_allocations]
    end

    if @store.create_with_admin_and_inventory!
      success_message = 'Store was successfully created.'
      success_message += " Store admin account created for #{@store.admin_email}." if @store.create_admin_user
      success_message += " Inventory allocated to store." if @store.initial_inventory_allocations.present?

      redirect_to admin_stores_path, notice: success_message
    else
      @available_products = @store.available_products_for_allocation
      prepare_inventory_data
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @store.update(store_params)
      redirect_to admin_stores_path, notice: 'Store was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @store.can_be_deleted?
      @store.destroy
      redirect_to admin_stores_path, notice: 'Store was successfully deleted.'
    else
      redirect_to admin_stores_path, alert: 'Cannot delete store. It has associated bookings.'
    end
  end

  def toggle_status
    @store.update(status: !@store.status)

    respond_to do |format|
      format.html { redirect_to admin_stores_path, notice: "Store status updated." }
      format.json { render json: { status: 'success', new_status: @store.status } }
    end
  end

  def assign_admin
    @available_users = User.where(user_type: ['admin', 'store_admin'])
                          .where('assigned_store_id IS NULL OR assigned_store_id = ?', @store.id)
                          .order(:first_name, :last_name)
  end

  def update_admin
    user_id = params[:store][:store_admin_user_id]

    if user_id.present?
      user = User.find(user_id)

      ActiveRecord::Base.transaction do
        # Remove previous store admin assignment
        if @store.store_admin_user
          @store.store_admin_user.update!(assigned_store: nil)
        end

        # Assign new store admin
        user.update!(
          user_type: 'store_admin',
          assigned_store: @store,
          store_permissions: {
            'can_manage_inventory' => true,
            'can_create_bookings' => true,
            'can_view_reports' => true,
            'can_request_transfers' => true,
            'can_approve_transfers' => false
          }
        )

        @store.update!(store_admin_user: user)
      end

      redirect_to admin_stores_path, notice: 'Store admin assigned successfully'
    else
      # Remove current admin
      if @store.store_admin_user
        @store.store_admin_user.update!(assigned_store: nil, user_type: 'admin')
        @store.update!(store_admin_user: nil)
      end

      redirect_to admin_stores_path, notice: 'Store admin removed'
    end
  end

  def inventory
    @products = @store.store_products_with_inventory.includes(:category, :stock_batches)
    @inventory_summary = @store.store_inventory_summary
    @low_stock_products = @store.low_stock_products
  end

  def transfer_inventory
    @products = Product.joins(:stock_batches)
                      .where(stock_batches: { status: 'active' })
                      .where('stock_batches.quantity_remaining > 0')
                      .distinct
                      .includes(:category)
    @other_stores = Store.where.not(id: @store.id).active
  end

  def transfer
    @available_products = @store.available_products_for_allocation.includes(:category)
    @inventory_data = {}
    @total_available_value = 0

    @available_products.each do |product|
      central_inventory = @store.central_inventory_for_product(product.id)
      store_inventory = @store.store_inventory_for_product(product.id)

      # Get the latest stock batch for pricing
      latest_batch = StockBatch.where(product_id: product.id, store_id: nil, status: 'active')
                               .where('quantity_remaining > 0')
                               .order(batch_date: :desc, created_at: :desc)
                               .first

      price = latest_batch&.selling_price || product.price || 0
      value = central_inventory * price
      @total_available_value += value

      @inventory_data[product.id] = {
        product: product,
        central_available: central_inventory,
        store_current: store_inventory,
        price: price,
        total_value: value,
        unit: product.unit_type || 'Unit'
      }
    end

    @total_available_value = @total_available_value.round(2)
  end

  def process_transfer
    transfer_items = params[:transfer_items] || {}

    begin
      ActiveRecord::Base.transaction do
        total_transferred = 0

        transfer_items.each do |product_id, quantity_str|
          quantity = quantity_str.to_f
          next if quantity <= 0

          product = Product.find(product_id)
          central_available = @store.central_inventory_for_product(product_id)

          if quantity > central_available
            raise StandardError, "#{product.name}: Requested #{quantity} but only #{central_available} available"
          end

          # Transfer inventory using existing method
          @store.transfer_inventory_from_central(product, quantity)
          total_transferred += 1
        end

        flash[:notice] = "Successfully transferred #{total_transferred} products to #{@store.name}"
        redirect_to transfer_admin_store_path(@store)
      end
    rescue StandardError => e
      flash[:alert] = "Transfer failed: #{e.message}"
      redirect_to transfer_admin_store_path(@store)
    end
  end

  def current_stock
    @store_products = @store.store_products_with_inventory.includes(:category, :stock_batches)
    @stock_summary = {}
    @total_stock_value = 0
    @total_products = @store_products.count
    @low_stock_items = 0

    @store_products.each do |product|
      # Get total available quantity for this product in this store
      available_quantity = @store.available_inventory(product.id)

      # Get stock batches for this product in this store
      stock_batches = product.stock_batches.where(store_id: @store.id, status: 'active')
                             .where('quantity_remaining > 0')
                             .order(:batch_date)

      # Calculate weighted average price
      total_value = stock_batches.sum { |batch| batch.quantity_remaining * batch.selling_price }
      average_price = available_quantity > 0 ? (total_value / available_quantity) : 0

      # Check if low stock (using auto_transfer_threshold or default 10)
      threshold = @store.auto_transfer_threshold || 10
      is_low_stock = available_quantity <= threshold
      @low_stock_items += 1 if is_low_stock

      # Calculate total value for this product
      product_total_value = available_quantity * average_price
      @total_stock_value += product_total_value

      @stock_summary[product.id] = {
        product: product,
        available_quantity: available_quantity,
        average_price: average_price.round(2),
        total_value: product_total_value.round(2),
        is_low_stock: is_low_stock,
        threshold: threshold,
        stock_batches: stock_batches,
        unit_type: product.unit_type || 'Unit'
      }
    end

    @total_stock_value = @total_stock_value.round(2)
  end

  def summary
    # Get date range parameters
    @start_date = params[:start_date]&.to_date || Date.current.beginning_of_month
    @end_date = params[:end_date]&.to_date || Date.current

    # Ensure end_date is end of day for queries
    end_date_time = @end_date.end_of_day

    # Get bookings data
    @bookings = @store.bookings.where(created_at: @start_date..end_date_time)
    @expenses = @store.expenses.where(expense_date: @start_date..@end_date)

    # Calculate summary metrics
    @total_bookings = @bookings.count
    @total_booking_amount = @bookings.sum(:total_amount) || 0
    @total_expenses = @expenses.sum(:amount) || 0
    @net_profit = @total_booking_amount - @total_expenses

    # Get recent data for display
    @recent_bookings = @bookings.includes(:customer)
                              .order(created_at: :desc)
                              .limit(10)

    @recent_expenses = @expenses.includes(:created_by)
                               .order(expense_date: :desc)
                               .limit(10)

    # Category breakdown for expenses
    @expense_categories = @expenses.group(:category).sum(:amount)

    # Status breakdown for bookings
    @booking_statuses = @bookings.group(:status).count

    respond_to do |format|
      format.html
      format.json do
        render json: {
          total_bookings: @total_bookings,
          total_booking_amount: @total_booking_amount.to_f,
          total_expenses: @total_expenses.to_f,
          recent_bookings: @recent_bookings.map { |booking|
            {
              id: booking.id,
              booking_number: booking.booking_number || "BK-#{booking.id}",
              customer_name: booking.customer&.full_name || booking.customer_name,
              created_at: booking.created_at,
              total_amount: booking.total_amount || 0,
              status: booking.status || 'pending'
            }
          },
          recent_expenses: @recent_expenses.map { |expense|
            {
              id: expense.id,
              title: expense.title,
              category: expense.category,
              expense_date: expense.expense_date,
              amount: expense.amount
            }
          }
        }
      end
    end
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def check_collect_from_store_enabled
    unless SystemSetting.collect_from_store_enabled?
      redirect_to admin_system_settings_path, alert: 'Enable "Collect From Store" feature first in System Settings.'
    end
  end

  def store_params
    params.require(:store).permit(:name, :description, :address, :city, :state,
                                   :pincode, :contact_person, :contact_mobile,
                                   :email, :gst_no, :status, :inventory_management_enabled,
                                   :auto_transfer_threshold, :manager_email, :operating_hours,
                                   :timezone, :store_admin_user_id, :create_admin_user,
                                   :admin_username, :admin_email, :admin_password,
                                   :admin_first_name, :admin_last_name, :admin_mobile)
  end

  def prepare_inventory_data
    @inventory_data = {}
    @total_inventory_value = 0

    @available_products&.each do |product|
      available_qty = @store.central_inventory_for_product(product.id)
      product_value = available_qty * (product.price || 0)
      @total_inventory_value += product_value

      @inventory_data[product.id] = {
        name: product.name,
        category: product.category&.name,
        available: available_qty,
        unit: product.unit_type,
        price: product.price || 0,
        total_value: product_value
      }
    end

    # Round to 2 decimal places
    @total_inventory_value = @total_inventory_value.round(2)
  end

  def get_product_availability
    product_id = params[:product_id]
    store_id = params[:store_id] # For checking existing store inventory if needed

    if product_id.present?
      product = Product.find(product_id)
      store = store_id.present? ? Store.find(store_id) : Store.new

      # Get central inventory availability
      central_available = store.central_inventory_for_product(product_id)

      # Get store inventory if store exists
      store_available = store_id.present? ? store.store_inventory_for_product(product_id) : 0

      render json: {
        success: true,
        product: {
          id: product.id,
          name: product.name,
          sku: product.sku,
          unit: product.unit_type,
          price: product.price || 0,
          category: product.category&.name
        },
        inventory: {
          central_available: central_available,
          store_available: store_available,
          total_available: central_available + store_available
        }
      }
    else
      render json: { success: false, error: 'Product ID required' }, status: :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Product or Store not found' }, status: :not_found
  end
end