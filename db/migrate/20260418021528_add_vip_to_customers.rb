class AddVipToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :vip, :boolean, default: false
  end
end
