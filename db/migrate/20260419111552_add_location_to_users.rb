class AddLocationToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :longitude, :decimal
    add_column :users, :latitude, :decimal
  end
end
