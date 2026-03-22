class AddStoreAdminToUsers < ActiveRecord::Migration[8.0]
  def up
    # Note: user_type is a string column, not an enum
    # No need to alter enum - 'store_admin' can be used directly

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

    # Add indexes (only if they don't exist)
    add_index :users, :user_type, name: 'index_users_on_user_type' unless index_exists?(:users, :user_type, name: 'index_users_on_user_type')
    add_index :users, :assigned_store_id, name: 'index_users_on_assigned_store' unless index_exists?(:users, :assigned_store_id, name: 'index_users_on_assigned_store')
  end

  def down
    # Note: Cannot remove enum value in PostgreSQL without recreating the type
    remove_column :users, :store_permissions
    remove_column :users, :last_store_access
    remove_column :users, :store_access_logs
    remove_column :users, :notification_preferences
  end
end