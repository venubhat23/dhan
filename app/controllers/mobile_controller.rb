class MobileController < ApplicationController
  before_action :check_mobile_auth, except: [:login, :authenticate]
  layout 'mobile'

  # Skip all authorization checks for mobile controller
  skip_before_action :authenticate_user!, raise: false
  skip_load_and_authorize_resource
  skip_before_action :verify_authenticity_token, only: [:authenticate, :add_to_cart, :remove_from_cart, :update_cart, :get_cart, :search_products, :search_customers, :update_booking_status, :generate_invoice]

  def login
    # Public login page
  end

  def authenticate
    username = params[:username]
    password = params[:password]

    # Simple authentication - you can modify this logic
    if username == 'admin' && password == 'admin123'
      session[:mobile_authenticated] = true
      session[:mobile_user] = username
      redirect_to mobile_bookings_path
    else
      render json: { error: 'Invalid credentials' }, status: 401
    end
  end

  def bookings
    @store = Store.first # You can modify this to select appropriate store
    @bookings = @store&.bookings&.includes(:booking_items, :customer)&.order(created_at: :desc) || []

    # Filter bookings based on parameters
    if params[:status].present?
      @bookings = @bookings.where(status: params[:status])
    end

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @bookings = @bookings.where(
        "booking_number ILIKE ? OR customer_name ILIKE ? OR customer_phone ILIKE ?",
        search_term, search_term, search_term
      )
    end

    # Stats for dashboard
    @booking_stats = {
      total: @store&.bookings&.count || 0,
      draft: @store&.bookings&.where(status: 'draft')&.count || 0,
      confirmed: @store&.bookings&.where(status: 'confirmed')&.count || 0,
      completed: @store&.bookings&.where(status: 'completed')&.count || 0,
      total_value: @store&.bookings&.sum(:total_amount) || 0
    }
  end

  def new_booking
    @store = Store.first
    @booking = @store.bookings.build
    @products = Product.active.includes(:category, :stock_batches)
    @categories = Category.where(status: true).order(:name)
    @customers = Customer.order(:first_name, :last_name).limit(100)

    # Initialize cart in session
    session[:mobile_cart] ||= []
  end

  def create_booking
    @store = Store.first
    @booking = @store.bookings.build(booking_params)

    # Process cart items from session
    if session[:mobile_cart].present?
      session[:mobile_cart].each do |cart_item|
        @booking.booking_items.build(
          product_id: cart_item['product_id'],
          quantity: cart_item['quantity'],
          price: cart_item['price']
        )
      end
    end

    # Calculate total amount from booking items
    @booking.total_amount = @booking.booking_items.sum { |item| item.quantity * item.price }

    if @booking.save
      # Clear cart after successful booking creation
      session[:mobile_cart] = []
      redirect_to mobile_booking_path(@booking), notice: 'Booking created successfully'
    else
      @products = Product.active.includes(:category, :stock_batches)
      @categories = Category.where(status: true).order(:name)
      @customers = Customer.order(:first_name, :last_name).limit(100)
      render :new_booking
    end
  end

  def show_booking
    @booking = Booking.includes(:booking_items, :customer, :store).find(params[:id])
  end

  def invoice
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "invoice_#{@booking.booking_number}",
               page_size: 'A4',
               template: 'mobile/invoice.html.erb',
               layout: 'pdf.html.erb',
               show_as_html: params[:debug].present?
      end
    end
  end

  def logout
    session[:mobile_authenticated] = nil
    session[:mobile_user] = nil
    redirect_to mobile_login_path, notice: 'Logged out successfully'
  end

  # Cart management methods
  def add_to_cart
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    session[:mobile_cart] ||= []

    # Check if product already exists in cart
    existing_item = session[:mobile_cart].find { |item| item['product_id'] == product.id }

    if existing_item
      existing_item['quantity'] += quantity
    else
      session[:mobile_cart] << {
        'product_id' => product.id,
        'product_name' => product.name,
        'quantity' => quantity,
        'price' => product.price,
        'image_url' => product.image.attached? ? url_for(product.image) : (product.additional_images.any? ? url_for(product.additional_images.first) : nil)
      }
    end

    render json: {
      success: true,
      cart_count: session[:mobile_cart].sum { |item| item['quantity'] },
      message: "#{product.name} added to cart"
    }
  end

  def remove_from_cart
    session[:mobile_cart] ||= []
    session[:mobile_cart].reject! { |item| item['product_id'] == params[:product_id].to_i }

    render json: {
      success: true,
      cart_count: session[:mobile_cart].sum { |item| item['quantity'] }
    }
  end

  def update_cart
    session[:mobile_cart] ||= []
    cart_item = session[:mobile_cart].find { |item| item['product_id'] == params[:product_id].to_i }

    if cart_item
      cart_item['quantity'] = params[:quantity].to_i
      if cart_item['quantity'] <= 0
        session[:mobile_cart].reject! { |item| item['product_id'] == params[:product_id].to_i }
      end
    end

    render json: {
      success: true,
      cart_count: session[:mobile_cart].sum { |item| item['quantity'] },
      cart_total: session[:mobile_cart].sum { |item| item['quantity'] * item['price'] }
    }
  end

  def get_cart
    session[:mobile_cart] ||= []
    render json: {
      cart_items: session[:mobile_cart],
      cart_count: session[:mobile_cart].sum { |item| item['quantity'] },
      cart_total: session[:mobile_cart].sum { |item| item['quantity'] * item['price'] }
    }
  end

  # Product search API
  def search_products
    query = params[:q]
    category_id = params[:category_id]

    products = Product.active.includes(:category, :stock_batches)

    if query.present?
      products = products.where(
        "name ILIKE ? OR sku ILIKE ? OR barcode ILIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%"
      )
    end

    if category_id.present?
      products = products.where(category_id: category_id)
    end

    products = products.limit(20)

    render json: {
      products: products.map do |product|
        {
          id: product.id,
          name: product.name,
          sku: product.sku,
          price: product.price,
          stock: product.cached_total_batch_stock,
          category: product.category&.name,
          image_url: product.image.attached? ? url_for(product.image) : (product.additional_images.any? ? url_for(product.additional_images.first) : nil)
        }
      end
    }
  end

  # Customer search API
  def search_customers
    query = params[:q]

    customers = Customer.where(
      "first_name ILIKE ? OR last_name ILIKE ? OR mobile ILIKE ? OR email ILIKE ?",
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
    ).limit(20)

    render json: {
      customers: customers.map do |customer|
        {
          id: customer.id,
          name: customer.display_name,
          mobile: customer.mobile,
          email: customer.email,
          address: customer.address
        }
      end
    }
  end

  # Booking management methods
  def update_booking_status
    @booking = Booking.find(params[:id])
    new_status = params[:status]

    if @booking.update(status: new_status)
      render json: {
        success: true,
        message: "Booking status updated to #{new_status.humanize}",
        new_status: new_status
      }
    else
      render json: {
        success: false,
        message: "Failed to update booking status"
      }
    end
  end

  def generate_invoice
    @booking = Booking.find(params[:id])

    if @booking.generate_invoice_number
      render json: {
        success: true,
        message: "Invoice generated successfully",
        invoice_number: @booking.invoice_number
      }
    else
      render json: {
        success: false,
        message: "Failed to generate invoice"
      }
    end
  end

  private

  def check_mobile_auth
    unless session[:mobile_authenticated]
      redirect_to mobile_login_path
    end
  end

  def booking_params
    params.require(:booking).permit(:booking_number, :customer_name, :customer_phone,
                                   :delivery_address, :total_amount, :payment_status,
                                   :status, :customer_id, :payment_method, :notes,
                                   booking_items_attributes: [:id, :product_id, :quantity, :price, :_destroy])
  end
end