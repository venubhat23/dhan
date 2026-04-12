class AddIsMainInventoryToExpenses < ActiveRecord::Migration[8.0]
  def change
    add_column :expenses, :is_main_inventory, :boolean, default: false
  end
end
