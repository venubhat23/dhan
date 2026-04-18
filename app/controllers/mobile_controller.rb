class MobileController < ApplicationController
  before_action :check_mobile_auth, except: [:login, :authenticate]
  layout 'mobile'

  # Skip all authorization checks for mobile controller
  skip_before_action :authenticate_user!, raise: false
  skip_load_and_authorize_resource
  skip_before_action :verify_authenticity_token, only: [:authenticate]

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
    @bookings = @store&.bookings&.order(created_at: :desc) || []
  end

  def new_booking
    @store = Store.first
    @booking = @store.bookings.build
    @products = Product.active
  end

  def create_booking
    @store = Store.first
    @booking = @store.bookings.build(booking_params)

    if @booking.save
      redirect_to mobile_booking_path(@booking), notice: 'Booking created successfully'
    else
      @products = Product.active
      render :new_booking
    end
  end

  def show_booking
    @booking = Booking.find(params[:id])
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

  private

  def check_mobile_auth
    unless session[:mobile_authenticated]
      redirect_to mobile_login_path
    end
  end

  def booking_params
    params.require(:booking).permit(:booking_number, :customer_name, :customer_phone,
                                   :delivery_address, :total_amount, :payment_status,
                                   :status, booking_items_attributes: [:product_id, :quantity, :price])
  end
end