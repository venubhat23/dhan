#!/usr/bin/env ruby

puts "🧹 Duplicate Subscription Removal Script"
puts "=" * 50

# Find all duplicate subscription groups
duplicate_groups = MilkSubscription.joins(:customer, :product)
                                  .group(:customer_id, :product_id)
                                  .having('COUNT(*) > 1')
                                  .count

puts "📊 Found #{duplicate_groups.count} groups with duplicate subscriptions"

total_removed = 0
total_delivery_tasks_removed = 0
total_customer_formats_removed = 0

duplicate_groups.each do |key, count|
  customer_id, product_id = key
  customer = Customer.find(customer_id)
  product = Product.find(product_id)

  puts "\n👤 Processing: #{customer.first_name} #{customer.last_name}"
  puts "📦 Product: #{product.name}"
  puts "🔢 Found #{count} duplicate subscriptions"

  # Get all subscriptions for this customer-product combination, ordered by creation date
  subscriptions = MilkSubscription.where(customer_id: customer_id, product_id: product_id)
                                  .order(:created_at)

  # Keep the first subscription (oldest), remove others
  subscriptions_to_remove = subscriptions.offset(1)

  subscriptions_to_remove.each do |subscription|
    puts "  🗑️ Removing Subscription ID: #{subscription.id}"
    puts "     📅 Period: #{subscription.start_date} to #{subscription.end_date}"
    puts "     📏 Quantity: #{subscription.quantity} #{subscription.unit}"

    # Count associated records before deletion
    delivery_tasks_count = subscription.milk_delivery_tasks.count
    puts "     📱 Associated delivery tasks: #{delivery_tasks_count}"

    # Check for customer formats with same customer and product
    customer_formats = CustomerFormat.where(customer_id: customer_id, product_id: product_id)
    customer_formats_count = customer_formats.count
    puts "     📋 Customer formats for this customer-product: #{customer_formats_count}"

    # Perform deletion in transaction
    ActiveRecord::Base.transaction do
      # Remove associated delivery tasks
      subscription.milk_delivery_tasks.destroy_all
      total_delivery_tasks_removed += delivery_tasks_count

      # Remove duplicate customer formats (keep only one if multiple exist)
      if customer_formats.count > 1
        formats_to_remove = customer_formats.offset(1)
        removed_formats = formats_to_remove.count
        formats_to_remove.destroy_all
        total_customer_formats_removed += removed_formats
        puts "     🗑️ Removed #{removed_formats} duplicate customer formats"
      end

      # Remove the subscription itself
      subscription.destroy!
      total_removed += 1
    end

    puts "     ✅ Successfully removed subscription and associated records"
  end

  # Show remaining subscription info
  remaining_subscription = subscriptions.first
  puts "  ✅ Kept Subscription ID: #{remaining_subscription.id}"
  puts "     📅 Period: #{remaining_subscription.start_date} to #{remaining_subscription.end_date}"
  puts "     📏 Quantity: #{remaining_subscription.quantity} #{remaining_subscription.unit}"
  puts "     📱 Remaining delivery tasks: #{remaining_subscription.milk_delivery_tasks.count}"
end

puts "\n" + "=" * 50
puts "📊 REMOVAL SUMMARY"
puts "=" * 50
puts "🗑️ Duplicate subscriptions removed: #{total_removed}"
puts "📱 Delivery tasks removed: #{total_delivery_tasks_removed}"
puts "📋 Customer formats removed: #{total_customer_formats_removed}"

# Final verification
puts "\n🔍 VERIFICATION"
puts "=" * 20
remaining_duplicates = MilkSubscription.joins(:customer, :product)
                                      .group(:customer_id, :product_id)
                                      .having('COUNT(*) > 1')
                                      .count

if remaining_duplicates.empty?
  puts "✅ SUCCESS: No duplicate subscriptions remaining!"
else
  puts "⚠️ WARNING: #{remaining_duplicates.count} duplicate groups still exist"
  remaining_duplicates.each do |key, count|
    customer_id, product_id = key
    customer = Customer.find(customer_id)
    product = Product.find(product_id)
    puts "  - #{customer.first_name} #{customer.last_name} - #{product.name}: #{count} subscriptions"
  end
end

puts "\n📊 Final Statistics:"
puts "Total active subscriptions: #{MilkSubscription.where(status: 'active').count}"
puts "Total delivery tasks: #{MilkDeliveryTask.count}"
puts "Total customer formats: #{CustomerFormat.count}"

puts "\n✅ Duplicate subscription removal completed!"