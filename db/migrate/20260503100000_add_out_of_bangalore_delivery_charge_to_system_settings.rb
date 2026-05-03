class AddOutOfBangaloreDeliveryChargeToSystemSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :system_settings, :out_of_bangalore_delivery_charge, :decimal, precision: 8, scale: 2, default: 0.0
  end
end
