class AddLocationToDeliveryPeople < ActiveRecord::Migration[8.0]
  def change
    add_column :delivery_people, :longitude, :decimal
    add_column :delivery_people, :latitude, :decimal
  end
end
