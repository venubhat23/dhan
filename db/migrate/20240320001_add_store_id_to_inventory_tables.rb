class AddStoreIdToInventoryTables < ActiveRecord::Migration[8.0]
  def change
    # Add store_id to stock_batches for store-specific inventory
    add_reference :stock_batches, :store, null: true, foreign_key: true,
                  index: { name: 'index_stock_batches_on_store_id' }

    # Add store_id to stock_movements for store-specific tracking
    add_reference :stock_movements, :store, null: true, foreign_key: true,
                  index: { name: 'index_stock_movements_on_store_id' }

    # Add store admin user reference to stores
    add_reference :stores, :store_admin_user, null: true, foreign_key: { to_table: :users },
                  index: { name: 'index_stores_on_store_admin_user_id' }

    # Add store reference to users for store admin assignment
    add_reference :users, :assigned_store, null: true, foreign_key: { to_table: :stores },
                  index: { name: 'index_users_on_assigned_store_id' }

    # Add additional store management fields
    add_column :stores, :inventory_management_enabled, :boolean, default: true
    add_column :stores, :auto_transfer_threshold, :decimal, precision: 8, scale: 2, default: 10
    add_column :stores, :manager_email, :string
    add_column :stores, :operating_hours, :text
    add_column :stores, :timezone, :string, default: 'UTC'

    # Add indexes for performance
    add_index :stock_batches, [:store_id, :status], name: 'index_stock_batches_on_store_and_status'
    add_index :stock_batches, [:store_id, :product_id], name: 'index_stock_batches_on_store_and_product'
    add_index :stock_movements, [:store_id, :created_at], name: 'index_stock_movements_on_store_and_date'
  end
end