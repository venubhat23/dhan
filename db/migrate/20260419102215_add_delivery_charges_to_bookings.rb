class AddDeliveryChargesToBookings < ActiveRecord::Migration[8.0]
  def change
    add_column :bookings, :delivery_charges, :decimal
  end
end
