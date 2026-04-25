class Admin::DeliverySettingsController < Admin::ApplicationController
  before_action :set_delivery_charge, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
    @delivery_charges = DeliveryCharge.order(:pincode)
  end

  def new
    @delivery_charge = DeliveryCharge.new(charge_amount: 30.00, is_active: true)
  end

  def create
    @delivery_charge = DeliveryCharge.new(delivery_charge_params)

    if @delivery_charge.save
      redirect_to admin_delivery_settings_path, notice: 'Delivery charge added successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @delivery_charge.update(delivery_charge_params)
      redirect_to admin_delivery_settings_path, notice: 'Delivery charge updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @delivery_charge.destroy
    redirect_to admin_delivery_settings_path, notice: 'Delivery charge deleted.'
  end

  def toggle_status
    @delivery_charge.update(is_active: !@delivery_charge.is_active)
    redirect_to admin_delivery_settings_path, notice: "Delivery charge #{@delivery_charge.is_active? ? 'activated' : 'deactivated'}."
  end

  private

  def set_delivery_charge
    @delivery_charge = DeliveryCharge.find(params[:id])
  end

  def delivery_charge_params
    params.require(:delivery_charge).permit(:pincode, :area, :charge_amount, :is_active)
  end
end
