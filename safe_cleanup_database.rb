#!/usr/bin/env ruby

# Safe Database Cleanup Script for Dhanvantri Naturals
# This script keeps only 2 customers and limits other records to 10
# Run with: rails runner safe_cleanup_database.rb

puts "🧹 Safe Database Cleanup Script for Dhanvantri Naturals"
puts "=" * 60

# First, show current database statistics
puts "📊 Current Database Statistics:"
puts "-" * 40
puts "Customers: #{Customer.count rescue 'N/A'}"
puts "Subscriptions: #{MilkSubscription.count rescue 'N/A'}"
puts "Invoices: #{Invoice.count rescue 'N/A'}"
puts "Invoice Items: #{InvoiceItem.count rescue 'N/A'}"
puts "Orders: #{Order.count rescue 'N/A'}"
puts "Bookings: #{Booking.count rescue 'N/A'}"
puts

# Show which customers will be kept
customers_to_keep = Customer.order(:id).limit(2)
puts "📋 Customers that will be KEPT (first 2 by ID):"
if customers_to_keep.any?
  customers_to_keep.each do |customer|
    puts "  ✅ ID: #{customer.id} - #{customer.first_name} #{customer.last_name} (#{customer.email})"
  end
else
  puts "  ⚠️  No customers found in database"
end
puts

# Show what will be deleted
customers_to_delete_count = Customer.count - 2
customers_to_delete_count = 0 if customers_to_delete_count < 0

puts "⚠️  DELETION SUMMARY:"
puts "-" * 40
puts "Customers to DELETE: #{customers_to_delete_count}"
puts "Subscriptions: Keep 10, delete #{[MilkSubscription.count - 10, 0].max}"
puts "Invoices: Keep 10, delete #{[Invoice.count - 10, 0].max}"
puts "Invoice Items: Keep 10, delete #{[InvoiceItem.count - 10, 0].max}"
puts "Orders: Keep 10, delete #{[Order.count - 10, 0].max}"
puts "Bookings: Keep 10, delete #{[Booking.count - 10, 0].max}"
puts

# Confirmation prompt
print "⚡ Are you sure you want to proceed? This action CANNOT be undone! (yes/no): "
confirmation = gets.chomp.downcase

unless confirmation == 'yes'
  puts "❌ Cleanup cancelled. No changes made to the database."
  exit
end

puts
puts "🚀 Starting cleanup process..."
puts

begin
  # Use transaction for safety
  ActiveRecord::Base.transaction do
    # Step 1: Delete excess customers and their data
    if customers_to_delete_count > 0
      puts "🗑️  Step 1: Removing #{customers_to_delete_count} excess customers..."

      customer_ids_to_keep = customers_to_keep.pluck(:id)
      customers_to_delete = Customer.where.not(id: customer_ids_to_keep)
      customer_ids_to_delete = customers_to_delete.pluck(:id)

      # Delete customer-related records
      puts "   - Removing customer addresses..."
      CustomerAddress.where(customer_id: customer_ids_to_delete).destroy_all

      puts "   - Removing bookings..."
      Booking.where(customer_id: customer_ids_to_delete).destroy_all

      puts "   - Removing orders..."
      Order.where(customer_id: customer_ids_to_delete).destroy_all

      puts "   - Removing milk subscriptions..."
      MilkSubscription.where(customer_id: customer_ids_to_delete).destroy_all

      puts "   - Removing milk delivery tasks..."
      MilkDeliveryTask.where(customer_id: customer_ids_to_delete).destroy_all

      puts "   - Removing invoices and invoice items..."
      invoice_ids_to_delete = Invoice.where(customer_id: customer_ids_to_delete).pluck(:id)
      InvoiceItem.where(invoice_id: invoice_ids_to_delete).destroy_all
      Invoice.where(customer_id: customer_ids_to_delete).destroy_all

      puts "   - Removing wishlists..."
      Wishlist.where(customer_id: customer_ids_to_delete).destroy_all if defined?(Wishlist)

      puts "   - Removing notifications..."
      Notification.where(customer_id: customer_ids_to_delete).destroy_all if defined?(Notification)

      puts "   - Removing pending amounts..."
      PendingAmount.where(customer_id: customer_ids_to_delete).destroy_all if defined?(PendingAmount)

      puts "   - Removing client requests..."
      ClientRequest.where(customer_id: customer_ids_to_delete).destroy_all if defined?(ClientRequest)

      # Finally delete the customers
      customers_to_delete.destroy_all
      puts "   ✅ Removed #{customers_to_delete_count} customers and their data"
    end

    # Step 2: Limit subscriptions
    puts "📊 Step 2: Limiting milk subscriptions to 10..."
    if MilkSubscription.count > 10
      excess_subscriptions = MilkSubscription.order(:id).offset(10)
      deleted_count = excess_subscriptions.count
      excess_subscriptions.destroy_all
      puts "   ✅ Kept 10, removed #{deleted_count} subscriptions"
    else
      puts "   ℹ️  Already 10 or fewer subscriptions"
    end

    # Step 3: Limit invoices
    puts "📄 Step 3: Limiting invoices to 10..."
    if Invoice.count > 10
      excess_invoices = Invoice.order(:id).offset(10)
      deleted_count = excess_invoices.count
      excess_invoices.destroy_all
      puts "   ✅ Kept 10, removed #{deleted_count} invoices"
    else
      puts "   ℹ️  Already 10 or fewer invoices"
    end

    # Step 4: Limit invoice items
    puts "📝 Step 4: Limiting invoice items to 10..."
    if InvoiceItem.count > 10
      excess_items = InvoiceItem.order(:id).offset(10)
      deleted_count = excess_items.count
      excess_items.destroy_all
      puts "   ✅ Kept 10, removed #{deleted_count} invoice items"
    else
      puts "   ℹ️  Already 10 or fewer invoice items"
    end

    # Step 5: Limit other records
    puts "🧽 Step 5: Limiting other records to 10..."

    if defined?(Order) && Order.count > 10
      Order.order(:id).offset(10).destroy_all
      puts "   ✅ Limited orders to 10"
    end

    if defined?(Booking) && Booking.count > 10
      Booking.order(:id).offset(10).destroy_all
      puts "   ✅ Limited bookings to 10"
    end

    puts "   ✅ All records limited successfully"
  end

  puts
  puts "📈 Final Database Statistics:"
  puts "-" * 40
  puts "Customers: #{Customer.count}"
  puts "Subscriptions: #{MilkSubscription.count}"
  puts "Invoices: #{Invoice.count}"
  puts "Invoice Items: #{InvoiceItem.count}"
  puts "Orders: #{Order.count rescue 'N/A'}"
  puts "Bookings: #{Booking.count rescue 'N/A'}"
  puts

  puts "✅ Database cleanup completed successfully!"
  puts "🎉 Dhanvantri Naturals database is now clean and optimized"

rescue => e
  puts "❌ Error during cleanup: #{e.message}"
  puts "🔄 All changes have been rolled back due to transaction"
  raise e
end