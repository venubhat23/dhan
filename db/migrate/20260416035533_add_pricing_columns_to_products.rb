class AddPricingColumnsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :cost_price, :decimal
    add_column :products, :purchase_price, :decimal
  end
end
