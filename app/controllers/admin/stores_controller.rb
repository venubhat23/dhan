class Admin::StoresController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy, :toggle_status, :assign_admin, :update_admin, :inventory, :transfer_inventory]
  before_action :check_collect_from_store_enabled, only: [:index, :new, :create]

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
                                   :admin_email, :admin_password, :admin_first_name,
                                   :admin_last_name, :admin_mobile)
  end

  def prepare_inventory_data
    @inventory_data = {}
    @available_products&.each do |product|
      @inventory_data[product.id] = {
        name: product.name,
        category: product.category&.name,
        available: @store.central_inventory_for_product(product.id),
        unit: product.unit_type
      }
    end
  end

  def get_product_availability
    product_id = params[:product_id]
    if product_id.present?
      product = Product.find(product_id)
      available = Store.new.central_inventory_for_product(product_id)

      render json: {
        available: available,
        unit: product.unit_type,
        name: product.name
      }
    else
      render json: { error: 'Product ID required' }, status: :bad_request
    end
  end
end