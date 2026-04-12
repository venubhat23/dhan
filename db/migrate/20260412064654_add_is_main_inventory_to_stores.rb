class AddIsMainInventoryToStores < ActiveRecord::Migration[8.0]
  def change
    add_column :stores, :is_main_inventory, :boolean, default: false, null: false
    add_index :stores, :is_main_inventory
  end
end
