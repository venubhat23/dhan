class AddBarcodeToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :barcode, :string
    add_column :products, :barcode_type, :string, default: 'EAN13'

    # Add index after columns are created
    add_index :products, :barcode, unique: true, where: "barcode IS NOT NULL AND barcode != ''"
  end
end
