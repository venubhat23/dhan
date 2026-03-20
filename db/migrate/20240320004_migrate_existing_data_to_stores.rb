class MigrateExistingDataToStores < ActiveRecord::Migration[8.0]
  def up
    # Create default store if no stores exist
    if Store.count == 0
      default_store = Store.create!(
        name: 'Main Store',
        description: 'Default store for existing inventory',
        address: 'Default Address',
        city: 'Default City',
        state: 'Default State',
        pincode: '000000',
        contact_person: 'System Admin',
        contact_mobile: '0000000000',
        email: 'admin@store.com',
        status: true,
        inventory_management_enabled: true,
        auto_transfer_threshold: 10,
        timezone: 'Asia/Kolkata'
      )

      puts "Created default store: #{default_store.name} (ID: #{default_store.id})"
    else
      default_store = Store.first
      puts "Using existing store: #{default_store.name} (ID: #{default_store.id})"
    end

    # Assign all existing stock batches to default store
    stock_batch_count = StockBatch.where(store_id: nil).count
    if stock_batch_count > 0
      StockBatch.where(store_id: nil).update_all(store_id: default_store.id)
      puts "Assigned #{stock_batch_count} stock batches to default store"
    end

    # Assign all existing stock movements to default store
    stock_movement_count = StockMovement.where(store_id: nil).count
    if stock_movement_count > 0
      StockMovement.where(store_id: nil).update_all(store_id: default_store.id)
      puts "Assigned #{stock_movement_count} stock movements to default store"
    end

    # Assign all existing bookings to default store if not already assigned
    booking_count = Booking.where(store_id: nil).count
    if booking_count > 0
      Booking.where(store_id: nil).update_all(store_id: default_store.id)
      puts "Assigned #{booking_count} bookings to default store"
    end

    # Update existing admin users to have access to all stores
    admin_users = User.where(user_type: 'admin')
    admin_users.each do |user|
      user.update!(
        store_permissions: {
          'all_stores_access' => true,
          'can_create_stores' => true,
          'can_manage_transfers' => true,
          'can_assign_store_admins' => true
        }
      )
    end
    puts "Updated #{admin_users.count} admin users with store permissions"
  end

  def down
    # Remove store assignments
    StockBatch.update_all(store_id: nil)
    StockMovement.update_all(store_id: nil)
    # Don't remove booking store assignments as they might be intentionally set

    # Reset user permissions
    User.update_all(store_permissions: {})
  end
end