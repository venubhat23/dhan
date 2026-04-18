class AddGstNumberToVendors < ActiveRecord::Migration[8.0]
  def change
    add_column :vendors, :gst_number, :string
  end
end
