class Customer::CheckoutController < Customer::BaseController
  before_action :initialize_cart
  before_action :check_cart_not_empty, except: [:confirmation, :cart_order, :payment_callback]
  skip_before_action :verify_authenticity_token, only: [:payment_webhook]

  def show
    @cart_items = @cart[:items] || []
    @cart_total = calculate_cart_total
    @addresses = current_customer.customer_addresses || []
  end

  def address
    @addresses = current_customer.customer_addresses || []
    @new_address = CustomerAddress.new
  end

  def create_address
    @new_address = current_customer.customer_addresses.build(address_params)

    if @new_address.save
      redirect_to customer_checkout_payment_path, notice: 'Address added successfully!'
    else
      @addresses = current_customer.customer_addresses
      render :address
    end
  end

  def payment
    @cart_items = @cart[:items] || []
    @cart_total = calculate_cart_total
    @selected_address = find_selected_address

    if @selected_address.nil?
      redirect_to customer_checkout_address_path, alert: 'Please select a delivery address.'
      return
    end

    # Load collect from store settings and available stores
    @collect_from_store_enabled = SystemSetting.collect_from_store_enabled?
    @available_stores = Store.available_for_collection if @collect_from_store_enabled
    @selected_store = find_selected_store if @collect_from_store_enabled
  end

  def create
    Rails.logger.info "=== CHECKOUT CREATE ACTION CALLED ==="
    Rails.logger.info "Params: #{params.inspect}"
    Rails.logger.info "Session cart: #{session[:cart].inspect}"

    @selected_address = find_selected_address

    if @selected_address.nil?
      Rails.logger.error "No selected address found"
      redirect_to customer_checkout_address_path, alert: 'Please select a delivery address.'
      return
    end

    Rails.logger.info "Selected address: #{@selected_address.inspect}"

    # Check store selection if collect from store is enabled
    @collect_from_store_enabled = SystemSetting.collect_from_store_enabled?
    @selected_store = find_selected_store if @collect_from_store_enabled

    # Create booking/order
    begin
      ActiveRecord::Base.transaction do
        @booking = create_booking

        if @booking && @booking.persisted?
          # Online payment — call Cashfree before clearing cart
          if params[:payment_method] == 'online'
            cf_result = initiate_cashfree_payment(@booking)
            if cf_result[:success]
              session[:cart] = { items: [] }
              redirect_to customer_checkout_cashfree_path(
                booking_id: @booking.id,
                session_id: cf_result[:payment_session_id],
                cf_order_id: cf_result[:cf_order_id]
              )
              return
            else
              raise ActiveRecord::Rollback
            end
          end

          # COD — clear cart and go to confirmation
          session[:cart] = { items: [] }
          redirect_to customer_checkout_confirmation_path(booking_id: @booking.id)
        else
          error_message = @booking ? "Booking creation failed: #{@booking.errors.full_messages.join(', ')}" : "Booking creation failed: Invalid cart or product data"
          Rails.logger.error error_message
          raise ActiveRecord::Rollback
        end
      end
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error "Booking validation error: #{e.message}"
      @cart_items = @cart[:items] || []
      @cart_total = calculate_cart_total
      @available_stores = Store.available_for_collection if @collect_from_store_enabled
      flash.now[:alert] = "Failed to process order: #{e.message}"
      render :payment
    rescue ActiveRecord::Rollback
      @cart_items = @cart[:items] || []
      @cart_total = calculate_cart_total
      @available_stores = Store.available_for_collection if @collect_from_store_enabled
      flash.now[:alert] = 'Failed to process order. Please try again.'
      render :payment
    rescue => e
      Rails.logger.error "Unexpected error in checkout: #{e.message}\n#{e.backtrace.join('\n')}"
      @cart_items = @cart[:items] || []
      @cart_total = calculate_cart_total
      @available_stores = Store.available_for_collection if @collect_from_store_enabled
      flash.now[:alert] = 'An unexpected error occurred. Please try again.'
      render :payment
    end
  end

  def confirmation
    @booking = current_customer.bookings.includes(booking_items: :product).find(params[:booking_id])
    @booking_items = @booking.booking_items
  rescue ActiveRecord::RecordNotFound
    redirect_to customer_orders_path, alert: 'Order not found.'
  end

  # GET /customer/checkout/cashfree?booking_id=X&session_id=Y&cf_order_id=Z
  # Renders the Cashfree JS drop page (auto-opens payment modal)
  def cashfree
    @booking    = current_customer.bookings.find(params[:booking_id])
    @session_id = params[:session_id]
    @cf_order_id = params[:cf_order_id]
  rescue ActiveRecord::RecordNotFound
    redirect_to customer_checkout_payment_path, alert: 'Booking not found.'
  end

  # GET /customer/checkout/payment_callback?booking_id=X
  # Cashfree redirects here after payment attempt
  def payment_callback
    booking = current_customer.bookings.find_by(id: params[:booking_id])
    unless booking
      redirect_to customer_orders_path, alert: 'Order not found.'
      return
    end

    # Verify payment status from Cashfree
    if booking.cashfree_order_id.present?
      result = CashfreeService.new.get_order(booking.cashfree_order_id)
      if result['order_status'] == 'PAID'
        booking.update(payment_status: :paid, payment_method: 'online', status: 'confirmed')
        redirect_to customer_checkout_confirmation_path(booking_id: booking.id),
                    notice: 'Payment successful! Your order is confirmed.'
        return
      end
    end

    redirect_to customer_checkout_confirmation_path(booking_id: booking.id),
                notice: 'Order placed. Payment verification in progress.'
  end

  # POST /customer/checkout/payment_webhook
  # Cashfree server-to-server webhook
  def payment_webhook
    raw_body  = request.raw_post
    timestamp = request.headers['x-webhook-timestamp']
    signature = request.headers['x-webhook-signature']

    unless CashfreeService.new.verify_webhook_signature(raw_body, timestamp, signature)
      Rails.logger.warn "Web Cashfree webhook: invalid signature"
      render json: { error: 'Invalid signature' }, status: :unauthorized
      return
    end

    data         = JSON.parse(raw_body)
    event_type   = data['type']
    cf_order_id  = data.dig('data', 'order', 'order_id')
    order_status = data.dig('data', 'order', 'order_status')

    if event_type == 'PAYMENT_SUCCESS_WEBHOOK' && order_status == 'PAID'
      booking = Booking.find_by(cashfree_order_id: cf_order_id)
      booking&.update(payment_status: :paid, payment_method: 'online', status: 'confirmed')
    end

    render json: { received: true }
  rescue JSON::ParserError
    render json: { error: 'Invalid payload' }, status: :bad_request
  end

  def cart_order
    Rails.logger.info "=== CART ORDER API CALLED ==="

    cart_items = @cart[:items]

    if cart_items.blank?
      render json: { success: false, error: 'Cart is empty' }, status: :bad_request
      return
    end

    booking_error = nil

    begin
      ActiveRecord::Base.transaction do
        booking_attributes = {
          customer: current_customer,
          booking_number: generate_booking_number,
          booking_date: Time.current,
          status: 'confirmed',
          payment_method: params[:payment_method] || 'cod',
          payment_status: :unpaid,
          customer_name: current_customer.display_name,
          customer_email: current_customer.email,
          customer_phone: current_customer.mobile,
          delivery_address: params[:delivery_address]
        }

        @booking = Booking.new(booking_attributes)
        total_amount = 0

        cart_items.each do |item|
          product = Product.find(item['product_id'])
          quantity = item['quantity'].to_f
          price = item['price'].to_f

          @booking.booking_items.build(product: product, quantity: quantity, price: price)
          total_amount += (price * quantity)
          Rails.logger.info "Added booking item: #{product.name} x #{quantity} @ ₹#{price}"
        end

        @booking.subtotal = total_amount
        @booking.total_amount = total_amount

        if @booking.save
          @booking.calculate_totals
          @booking.save!

          Rails.logger.info "Booking created successfully: #{@booking.booking_number}"
          Rails.logger.info "Total amount: ₹#{@booking.total_amount}"
        else
          booking_error = @booking.errors.full_messages.join(', ')
          Rails.logger.error "Booking creation failed: #{booking_error}"
          raise ActiveRecord::Rollback
        end
      end

      if booking_error.present?
        render json: { success: false, error: booking_error }, status: :unprocessable_entity
        return
      end

      payment_method = params[:payment_method] || 'cod'

      # For online/UPI payments, initiate Cashfree and return payment_session_id
      if %w[online upi card netbanking cashfree].include?(payment_method)
        cf_order_id = "MKS_#{Time.current.strftime('%Y%m%d%H%M%S')}_#{SecureRandom.hex(4).upcase}"
        cf_result = CashfreeService.new.create_order(
          order_id:   cf_order_id,
          amount:     @booking.total_amount,
          customer: {
            id:    current_customer.id,
            name:  current_customer.display_name,
            email: current_customer.email,
            phone: current_customer.mobile.to_s
          },
          return_url: customer_checkout_payment_callback_url(booking_id: @booking.id),
          notify_url: customer_checkout_payment_webhook_url
        )

        if cf_result['payment_session_id'].present?
          @booking.update!(cashfree_order_id: cf_order_id)
          session[:cart] = { items: [] }
          Rails.logger.info "Cashfree session created for booking #{@booking.id}: #{cf_order_id}"
          render json: {
            success: true,
            message: 'Order created, complete payment',
            booking_number: @booking.booking_number,
            booking_id: @booking.id,
            total_amount: @booking.total_amount,
            payment_session_id: cf_result['payment_session_id'],
            cf_order_id: cf_order_id
          }
        else
          error_msg = cf_result['message'] || 'Failed to initiate payment'
          Rails.logger.error "Cashfree order creation failed for booking #{@booking.id}: #{cf_result.inspect}"
          @booking.update(status: 'cancelled')
          render json: { success: false, error: error_msg }, status: :unprocessable_entity
        end
      else
        session[:cart] = { items: [] }
        render json: {
          success: true,
          message: 'Order placed successfully',
          booking_number: @booking.booking_number,
          booking_id: @booking.id,
          total_amount: @booking.total_amount
        }
      end

    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.error "Product not found: #{e.message}"
      render json: { success: false, error: "Product not found: #{e.message}" }, status: :unprocessable_entity
    rescue => e
      Rails.logger.error "Unexpected error in cart_order: #{e.message}\n#{e.backtrace.join('\n')}"
      render json: { success: false, error: 'An unexpected error occurred' }, status: :internal_server_error
    end
  end

  private

  def initialize_cart
    @cart = session[:cart] ||= { items: [] }
  end

  def check_cart_not_empty
    if @cart[:items].blank?
      redirect_to customer_products_path, alert: 'Your cart is empty.'
    end
  end

  def calculate_cart_total
    @cart[:items].sum { |item| item['price'].to_f * item['quantity'].to_f }
  end

  def find_selected_address
    address_id = params[:selected_address_id] || session[:selected_address_id]
    return nil if address_id.blank?

    current_customer.customer_addresses.find_by(id: address_id)
  end

  def find_selected_store
    store_id = params[:selected_store_id] || session[:selected_store_id]
    return nil if store_id.blank?

    Store.available_for_collection.find_by(id: store_id)
  end

  def create_booking
    # Validate cart items
    if @cart[:items].blank?
      Rails.logger.error "Empty cart items during booking creation"
      return nil
    end

    Rails.logger.info "Creating booking with cart items: #{@cart[:items].inspect}"

    # Create booking with minimal attributes first (like admin controller)
    booking_attributes = {
      customer: current_customer,
      booking_number: generate_booking_number,
      booking_date: Time.current,
      status: 'confirmed',
      payment_method: params[:payment_method] || 'cod',
      customer_name: current_customer.full_name || current_customer.first_name,
      customer_email: current_customer.email,
      customer_phone: current_customer.mobile,
      delivery_address: format_delivery_address
    }

    # Add store selection if collect from store is enabled
    if SystemSetting.collect_from_store_enabled? && @selected_store
      booking_attributes[:store_id] = @selected_store.id
    end

    booking = Booking.new(booking_attributes)

    # Build booking items (like admin controller)
    @cart[:items].each do |item|
      begin
        product = Product.find(item['product_id'])
        quantity = item['quantity'].to_f
        price = product.selling_price.to_f

        booking.booking_items.build(
          product: product,
          quantity: quantity,
          price: price
        )

        Rails.logger.info "Added booking item: #{product.name} x #{quantity} @ ₹#{price}"
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error "Product not found: #{item['product_id']}"
        return nil
      end
    end

    # Validate and save
    if booking.save
      # Calculate totals like admin controller
      booking.calculate_totals

      # Set payment status
      booking.payment_status = :unpaid
      booking.save!

      Rails.logger.info "Booking created successfully: #{booking.booking_number}"
      Rails.logger.info "Booking totals - Subtotal: #{booking.subtotal}, Tax: #{booking.tax_amount}, Total: #{booking.total_amount}"

      booking
    else
      Rails.logger.error "Booking creation failed: #{booking.errors.full_messages.join(', ')}"
      Rails.logger.error "Booking items errors: #{booking.booking_items.map(&:errors).map(&:full_messages).flatten.join(', ')}"
      nil
    end
  end


  def initiate_cashfree_payment(booking)
    cf_order_id = "CF_#{booking.booking_number}_#{Time.current.to_i}"
    result = CashfreeService.new.create_order(
      order_id:   cf_order_id,
      amount:     booking.total_amount,
      customer: {
        id:    current_customer.id,
        name:  current_customer.display_name,
        email: current_customer.email,
        phone: current_customer.mobile.to_s
      },
      return_url: customer_checkout_payment_callback_url(booking_id: booking.id),
      notify_url: customer_checkout_payment_webhook_url
    )
    if result['payment_session_id'].present?
      booking.update(cashfree_order_id: cf_order_id)
      { success: true, payment_session_id: result['payment_session_id'], cf_order_id: cf_order_id }
    else
      Rails.logger.error "Cashfree web payment initiation failed: #{result.inspect}"
      flash.now[:alert] = 'Unable to initiate online payment. Please try again or choose Cash on Delivery.'
      { success: false }
    end
  end

  def generate_booking_number
    "BK#{Date.current.strftime('%Y%m%d')}#{rand(1000..9999)}"
  end


  def format_delivery_address
    return '' unless @selected_address

    "#{@selected_address.name}\n#{@selected_address.address}\n#{@selected_address.landmark}\n#{@selected_address.city}, #{@selected_address.state} - #{@selected_address.pincode}\nMobile: #{@selected_address.mobile}"
  end

  def address_params
    params.require(:customer_address).permit(
      :name, :mobile, :address_type, :address, :landmark,
      :city, :state, :pincode, :is_default
    )
  end
end