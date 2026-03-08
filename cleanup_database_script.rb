#!/usr/bin/env ruby

# Database Cleanup Script for Dhanvantri Naturals
# This script keeps only 2 customers and limits other records to 10
# Run with: rails runner cleanup_database_script.rb

puts "🧹 Starting Database Cleanup Script for Dhanvantri Naturals..."
puts "=" * 60

# Step 1: Get the first 2 customers to keep
customers_to_keep = Customer.order(:id).limit(2)
customer_ids_to_keep = customers_to_keep.pluck(:id)

puts "📋 Customers to keep:"
customers_to_keep.each do |customer|
  puts "  - ID: #{customer.id}, Name: #{customer.first_name} #{customer.last_name}, Email: #{customer.email}"
end
puts

# Step 2: Delete customers and their related data (except the 2 to keep)
puts "🗑️  Removing excess customers..."

customers_to_delete = Customer.where.not(id: customer_ids_to_keep)
deleted_customers_count = customers_to_delete.count

if deleted_customers_count > 0
  puts "   Deleting #{deleted_customers_count} customers and their related data..."

  # Get customer IDs to delete
  customer_ids_to_delete = customers_to_delete.pluck(:id)

  # Delete related records first (due to foreign key constraints)
  puts "   - Deleting customer addresses..."
  CustomerAddress.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting bookings..."
  Booking.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting orders..."
  Order.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting milk subscriptions..."
  MilkSubscription.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting milk delivery tasks..."
  MilkDeliveryTask.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting invoices and invoice items..."
  invoice_ids_to_delete = Invoice.where(customer_id: customer_ids_to_delete).pluck(:id)
  InvoiceItem.where(invoice_id: invoice_ids_to_delete).delete_all
  Invoice.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting wishlists..."
  Wishlist.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting notifications..."
  Notification.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting pending amounts..."
  PendingAmount.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting client requests..."
  ClientRequest.where(customer_id: customer_ids_to_delete).delete_all

  puts "   - Deleting booking schedules..."
  BookingSchedule.where(customer_id: customer_ids_to_delete).delete_all

  # Finally delete the customers
  customers_to_delete.delete_all
  puts "   ✅ Deleted #{deleted_customers_count} customers and their related data"
else
  puts "   ℹ️  No excess customers to delete"
end
puts

# Step 3: Limit subscriptions to 10 records
puts "📊 Limiting milk subscriptions to 10 records..."
subscription_count = MilkSubscription.count
if subscription_count > 10
  subscriptions_to_delete = MilkSubscription.order(:id).offset(10)
  subscription_ids_to_delete = subscriptions_to_delete.pluck(:id)

  # Delete related delivery tasks first
  MilkDeliveryTask.where(subscription_id: subscription_ids_to_delete).delete_all
  subscriptions_to_delete.delete_all

  puts "   ✅ Kept 10 subscriptions, deleted #{subscription_count - 10}"
else
  puts "   ℹ️  Only #{subscription_count} subscriptions found, no cleanup needed"
end
puts

# Step 4: Limit invoices to 10 records
puts "📄 Limiting invoices to 10 records..."
invoice_count = Invoice.count
if invoice_count > 10
  invoices_to_delete = Invoice.order(:id).offset(10)
  invoice_ids_to_delete = invoices_to_delete.pluck(:id)

  # Delete invoice items first
  InvoiceItem.where(invoice_id: invoice_ids_to_delete).delete_all
  invoices_to_delete.delete_all

  puts "   ✅ Kept 10 invoices, deleted #{invoice_count - 10}"
else
  puts "   ℹ️  Only #{invoice_count} invoices found, no cleanup needed"
end
puts

# Step 5: Limit invoice items to 10 records
puts "📝 Limiting invoice items to 10 records..."
invoice_item_count = InvoiceItem.count
if invoice_item_count > 10
  items_to_delete = InvoiceItem.order(:id).offset(10)
  deleted_items = items_to_delete.count
  items_to_delete.delete_all

  puts "   ✅ Kept 10 invoice items, deleted #{deleted_items}"
else
  puts "   ℹ️  Only #{invoice_item_count} invoice items found, no cleanup needed"
end
puts

# Step 6: Clean up other related tables (optional)
puts "🧽 Cleaning up other tables..."

# Limit orders
order_count = Order.count
if order_count > 10
  Order.order(:id).offset(10).delete_all
  puts "   ✅ Limited orders to 10 records"
end

# Limit bookings
booking_count = Booking.count
if booking_count > 10
  Booking.order(:id).offset(10).delete_all
  puts "   ✅ Limited bookings to 10 records"
end

# Limit notifications
notification_count = Notification.count
if notification_count > 10
  Notification.order(:id).offset(10).delete_all
  puts "   ✅ Limited notifications to 10 records"
end

puts

# Step 7: Display final statistics
puts "📈 Final Database Statistics:"
puts "-" * 40
puts "Customers: #{Customer.count}"
puts "Subscriptions: #{MilkSubscription.count}"
puts "Invoices: #{Invoice.count}"
puts "Invoice Items: #{InvoiceItem.count}"
puts "Orders: #{Order.count}"
puts "Bookings: #{Booking.count}"
puts "Notifications: #{Notification.count}"
puts

puts "✅ Database cleanup completed successfully!"
puts "🎉 Dhanvantri Naturals database is now optimized with clean data"