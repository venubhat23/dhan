class AddWholesalePriceToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :wholesale_price, :decimal, precision: 10, scale: 2
  end
end
