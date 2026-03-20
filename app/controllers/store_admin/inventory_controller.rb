class StoreAdmin::InventoryController < StoreAdmin::ApplicationController
  before_action :ensure_inventory_access
  before_action :set_product, only: [:show, :adjust_stock, :update_stock]

  def index
    @products = @current_store.store_products_with_inventory.includes(:category, :stock_batches)
    @products = @products.search(params[:search]) if params[:search].present?
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?

    # Pagination
    @products = @products.page(params[:page]).per(20)

    # Summary stats
    @total_products = @current_store.store_products_with_inventory.count
    @low_stock_count = @current_store.low_stock_products.count
    @total_inventory_value = @current_store.send(:calculate_total_inventory_value)
  end

  def show
    @store_inventory = @current_store.available_inventory(@product.id)
    @stock_batches = @current_store.stock_batches
                                   .where(product: @product)
                                   .includes(:vendor)
                                   .order(:batch_date, :created_at)

    @recent_movements = @current_store.stock_movements
                                      .where(product: @product)
                                      .recent
                                      .limit(10)
                                      .includes(:product)

    @can_transfer = current_user.can_request_transfers?
    @other_stores = Store.where.not(id: @current_store.id).active if @can_transfer
  end

  def adjust_stock
    # Manual stock adjustment form
  end

  def update_stock
    quantity_change = params[:quantity_change].to_f
    reason = params[:reason]
    notes = params[:notes]

    if quantity_change == 0
      redirect_to store_admin_inventory_path(@product), alert: 'Quantity change cannot be zero.'
      return
    end

    # Get current stock
    current_stock = @current_store.available_inventory(@product.id)

    # Prevent negative stock
    if quantity_change < 0 && current_stock + quantity_change < 0
      redirect_to store_admin_inventory_path(@product),
                  alert: "Insufficient stock. Available: #{current_stock}"
      return
    end

    begin
      ActiveRecord::Base.transaction do
        if quantity_change > 0
          # Adding stock - create new batch
          create_adjustment_batch(@product, quantity_change.abs)
        else
          # Reducing stock - use FIFO to reduce from existing batches
          reduce_stock_from_batches(@product, quantity_change.abs)
        end

        # Create stock movement record
        @current_store.stock_movements.create!(
          product: @product,
          reference_type: 'adjustment',
          reference_id: current_user.id,
          movement_type: quantity_change > 0 ? 'added' : 'consumed',
          quantity: quantity_change,
          stock_before: current_stock,
          stock_after: current_stock + quantity_change,
          notes: "Manual adjustment by #{current_user.full_name}. Reason: #{reason}. #{notes}"
        )

        redirect_to store_admin_inventory_path(@product),
                    notice: "Stock adjusted successfully. #{quantity_change > 0 ? 'Added' : 'Removed'} #{quantity_change.abs} units."
      end
    rescue => e
      Rails.logger.error "Stock adjustment failed: #{e.message}"
      redirect_to store_admin_inventory_path(@product),
                  alert: 'Stock adjustment failed. Please try again.'
    end
  end

  def low_stock
    @low_stock_products = @current_store.low_stock_products
    @threshold = @current_store.auto_transfer_threshold || 10
  end

  def movements
    @stock_movements = @current_store.stock_movements
                                     .recent
                                     .includes(:product)
                                     .page(params[:page])
                                     .per(25)

    # Filter by product if specified
    if params[:product_id].present?
      @stock_movements = @stock_movements.where(product_id: params[:product_id])
      @selected_product = Product.find(params[:product_id])
    end

    # Filter by movement type if specified
    if params[:movement_type].present?
      @stock_movements = @stock_movements.where(movement_type: params[:movement_type])
    end
  end

  def request_transfer
    # Transfer request form - will be handled by transfers controller
    redirect_to new_store_admin_transfer_path(product_id: params[:product_id])
  end

  private

  def ensure_inventory_access
    unless current_user.can_manage_inventory?
      redirect_to store_admin_root_path, alert: 'Access denied. Inventory management permission required.'
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def create_adjustment_batch(product, quantity)
    # Find or create adjustment vendor
    adjustment_vendor = Vendor.find_or_create_by(name: 'Store Adjustment') do |vendor|
      vendor.email = 'adjustment@store.com'
      vendor.phone = '0000000000'
      vendor.address = 'Store Manual Adjustment'
      vendor.payment_type = 'Adjustment'
      vendor.status = true
    end

    StockBatch.create!(
      product: product,
      store: @current_store,
      vendor: adjustment_vendor,
      quantity_purchased: quantity,
      quantity_remaining: quantity,
      purchase_price: product.buying_price || product.price,
      selling_price: product.price,
      batch_date: Date.current,
      status: 'active'
    )
  end

  def reduce_stock_from_batches(product, quantity_to_reduce)
    remaining_to_reduce = quantity_to_reduce
    active_batches = @current_store.stock_batches
                                   .where(product: product, status: 'active')
                                   .where('quantity_remaining > 0')
                                   .order(:batch_date, :created_at)

    active_batches.each do |batch|
      break if remaining_to_reduce <= 0

      if batch.quantity_remaining >= remaining_to_reduce
        batch.update!(quantity_remaining: batch.quantity_remaining - remaining_to_reduce)
        remaining_to_reduce = 0
      else
        remaining_to_reduce -= batch.quantity_remaining
        batch.update!(quantity_remaining: 0, status: 'exhausted')
      end
    end

    if remaining_to_reduce > 0
      raise StandardError, "Insufficient stock to reduce. Missing #{remaining_to_reduce} units."
    end
  end
end