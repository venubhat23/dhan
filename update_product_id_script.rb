#!/usr/bin/env ruby

puts "Starting product_id update script..."
puts "Updating product_id from 1 to 2 across MilkSubscription, MilkDeliveryTask, and CustomerFormat models"
puts "=" * 80

# Track changes
changes_summary = {
  milk_subscriptions: { count: 0, updated: 0 },
  milk_delivery_tasks: { count: 0, updated: 0 },
  customer_formats: { count: 0, updated: 0 }
}

begin
  ActiveRecord::Base.transaction do
    # 1. Update MilkSubscription model
    puts "\n1. Updating MilkSubscription model..."
    milk_subscriptions = MilkSubscription.where(product_id: 1)
    changes_summary[:milk_subscriptions][:count] = milk_subscriptions.count

    if milk_subscriptions.any?
      puts "  Found #{milk_subscriptions.count} MilkSubscription records with product_id = 1"
      milk_subscriptions.each do |subscription|
        puts "    Updating MilkSubscription ID: #{subscription.id}"
        subscription.update!(product_id: 2)
        changes_summary[:milk_subscriptions][:updated] += 1
      end
      puts "  ✅ Updated #{changes_summary[:milk_subscriptions][:updated]} MilkSubscription records"
    else
      puts "  No MilkSubscription records found with product_id = 1"
    end

    # 2. Update MilkDeliveryTask model
    puts "\n2. Updating MilkDeliveryTask model..."
    milk_delivery_tasks = MilkDeliveryTask.where(product_id: 1)
    changes_summary[:milk_delivery_tasks][:count] = milk_delivery_tasks.count

    if milk_delivery_tasks.any?
      puts "  Found #{milk_delivery_tasks.count} MilkDeliveryTask records with product_id = 1"
      milk_delivery_tasks.each do |task|
        puts "    Updating MilkDeliveryTask ID: #{task.id} (Date: #{task.delivery_date})"
        task.update!(product_id: 2)
        changes_summary[:milk_delivery_tasks][:updated] += 1
      end
      puts "  ✅ Updated #{changes_summary[:milk_delivery_tasks][:updated]} MilkDeliveryTask records"
    else
      puts "  No MilkDeliveryTask records found with product_id = 1"
    end

    # 3. Update CustomerFormat model
    puts "\n3. Updating CustomerFormat model..."
    customer_formats = CustomerFormat.where(product_id: 1)
    changes_summary[:customer_formats][:count] = customer_formats.count

    if customer_formats.any?
      puts "  Found #{customer_formats.count} CustomerFormat records with product_id = 1"
      customer_formats.each do |format|
        puts "    Updating CustomerFormat ID: #{format.id} (Pattern: #{format.pattern})"
        format.update!(product_id: 2)
        changes_summary[:customer_formats][:updated] += 1
      end
      puts "  ✅ Updated #{changes_summary[:customer_formats][:updated]} CustomerFormat records"
    else
      puts "  No CustomerFormat records found with product_id = 1"
    end

    puts "\n" + "=" * 80
    puts "SUMMARY OF CHANGES:"
    puts "=" * 80
    puts "MilkSubscription   : #{changes_summary[:milk_subscriptions][:updated]}/#{changes_summary[:milk_subscriptions][:count]} updated"
    puts "MilkDeliveryTask   : #{changes_summary[:milk_delivery_tasks][:updated]}/#{changes_summary[:milk_delivery_tasks][:count]} updated"
    puts "CustomerFormat     : #{changes_summary[:customer_formats][:updated]}/#{changes_summary[:customer_formats][:count]} updated"
    puts "-" * 80

    total_found = changes_summary.values.sum { |v| v[:count] }
    total_updated = changes_summary.values.sum { |v| v[:updated] }
    puts "TOTAL: #{total_updated}/#{total_found} records updated successfully"

    if total_updated > 0
      puts "\n✅ All product_id updates completed successfully!"
      puts "Transaction committed - changes are permanent."
    else
      puts "\nℹ️  No records found with product_id = 1 to update."
    end
  end

rescue => e
  puts "\n❌ Error occurred during update:"
  puts "Error: #{e.message}"
  puts "Backtrace: #{e.backtrace.first(5).join("\n")}"
  puts "\n🔄 Transaction rolled back - no changes were made."
  raise e
end

puts "\nScript completed at #{Time.current}"