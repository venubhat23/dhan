class CreateStoreInventoryTransfers < ActiveRecord::Migration[8.0]
  def change
    create_table :store_inventory_transfers do |t|
      t.references :product, null: false, foreign_key: true
      t.references :from_store, null: true, foreign_key: { to_table: :stores }
      t.references :to_store, null: false, foreign_key: { to_table: :stores }
      t.references :initiated_by, null: false, foreign_key: { to_table: :users }
      t.references :approved_by, null: true, foreign_key: { to_table: :users }

      t.decimal :quantity, precision: 8, scale: 2, null: false
      t.decimal :transfer_price, precision: 10, scale: 2
      t.string :status, default: 'pending', null: false
      t.text :notes
      t.string :transfer_reference_number
      t.string :courier_details
      t.string :tracking_number

      # Timestamps for workflow
      t.datetime :initiated_at
      t.datetime :approved_at
      t.datetime :shipped_at
      t.datetime :completed_at
      t.datetime :cancelled_at

      # Metadata
      t.json :transfer_metadata
      t.decimal :shipping_cost, precision: 8, scale: 2
      t.integer :estimated_delivery_days

      t.timestamps
    end

    # Indexes for performance
    add_index :store_inventory_transfers, :transfer_reference_number, unique: true,
              name: 'index_transfers_on_reference_number'
    add_index :store_inventory_transfers, [:product_id, :status],
              name: 'index_transfers_on_product_and_status'
    add_index :store_inventory_transfers, [:from_store_id, :status],
              name: 'index_transfers_on_from_store_and_status'
    add_index :store_inventory_transfers, [:to_store_id, :status],
              name: 'index_transfers_on_to_store_and_status'
    add_index :store_inventory_transfers, [:initiated_by_id, :created_at],
              name: 'index_transfers_on_user_and_date'
    add_index :store_inventory_transfers, :status,
              name: 'index_transfers_on_status'

    # Add check constraint for positive quantity
    add_check_constraint :store_inventory_transfers, 'quantity > 0', name: 'positive_quantity'
  end
end