class AddStoreAdminToUsers < ActiveRecord::Migration[8.0]
  def up
    # Add store_admin to user_type enum
    execute <<-SQL
      ALTER TYPE user_type_enum ADD VALUE IF NOT EXISTS 'store_admin';
    SQL

    # Add additional fields for store admin functionality
    add_column :users, :store_permissions, :json, default: {}
    add_column :users, :last_store_access, :datetime
    add_column :users, :store_access_logs, :json, default: []
    add_column :users, :notification_preferences, :json, default: {
      'low_stock_alerts' => true,
      'transfer_notifications' => true,
      'booking_alerts' => true,
      'daily_reports' => false
    }

    # Add indexes
    add_index :users, :user_type, name: 'index_users_on_user_type'
    add_index :users, :assigned_store_id, name: 'index_users_on_assigned_store'
  end

  def down
    # Note: Cannot remove enum value in PostgreSQL without recreating the type
    remove_column :users, :store_permissions
    remove_column :users, :last_store_access
    remove_column :users, :store_access_logs
    remove_column :users, :notification_preferences
  end
end