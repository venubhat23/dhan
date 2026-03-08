#!/usr/bin/env ruby

puts "Starting delivery_person_id update script..."
puts "Updating delivery_person_id from 4 to 8 across MilkSubscription, MilkDeliveryTask, and CustomerFormat models"
puts "=" * 90

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
    milk_subscriptions = MilkSubscription.where(delivery_person_id: 4)
    changes_summary[:milk_subscriptions][:count] = milk_subscriptions.count

    if milk_subscriptions.any?
      puts "  Found #{milk_subscriptions.count} MilkSubscription records with delivery_person_id = 4"
      milk_subscriptions.each do |subscription|
        puts "    Updating MilkSubscription ID: #{subscription.id} (Customer: #{subscription.customer.first_name rescue 'N/A'})"
        subscription.update!(delivery_person_id: 8)
        changes_summary[:milk_subscriptions][:updated] += 1
      end
      puts "  ✅ Updated #{changes_summary[:milk_subscriptions][:updated]} MilkSubscription records"
    else
      puts "  No MilkSubscription records found with delivery_person_id = 4"
    end

    # 2. Update MilkDeliveryTask model
    puts "\n2. Updating MilkDeliveryTask model..."
    milk_delivery_tasks = MilkDeliveryTask.where(delivery_person_id: 4)
    changes_summary[:milk_delivery_tasks][:count] = milk_delivery_tasks.count

    if milk_delivery_tasks.any?
      puts "  Found #{milk_delivery_tasks.count} MilkDeliveryTask records with delivery_person_id = 4"

      # Update in batches for better performance
      batch_size = 100
      total_updated = 0

      milk_delivery_tasks.find_in_batches(batch_size: batch_size) do |batch|
        batch_count = batch.size
        MilkDeliveryTask.where(id: batch.map(&:id)).update_all(delivery_person_id: 8)
        total_updated += batch_count
        changes_summary[:milk_delivery_tasks][:updated] += batch_count
        puts "    Updated #{batch_count} MilkDeliveryTask records (Total: #{total_updated})"
      end
      puts "  ✅ Updated #{changes_summary[:milk_delivery_tasks][:updated]} MilkDeliveryTask records total"
    else
      puts "  No MilkDeliveryTask records found with delivery_person_id = 4"
    end

    # 3. Update CustomerFormat model
    puts "\n3. Updating CustomerFormat model..."
    customer_formats = CustomerFormat.where(delivery_person_id: 4)
    changes_summary[:customer_formats][:count] = customer_formats.count

    if customer_formats.any?
      puts "  Found #{customer_formats.count} CustomerFormat records with delivery_person_id = 4"
      customer_formats.each do |format|
        puts "    Updating CustomerFormat ID: #{format.id} (Customer: #{format.customer.first_name rescue 'N/A'}, Pattern: #{format.pattern})"
        format.update!(delivery_person_id: 8)
        changes_summary[:customer_formats][:updated] += 1
      end
      puts "  ✅ Updated #{changes_summary[:customer_formats][:updated]} CustomerFormat records"
    else
      puts "  No CustomerFormat records found with delivery_person_id = 4"
    end

    puts "\n" + "=" * 90
    puts "SUMMARY OF DELIVERY PERSON CHANGES:"
    puts "=" * 90
    puts "MilkSubscription   : #{changes_summary[:milk_subscriptions][:updated]}/#{changes_summary[:milk_subscriptions][:count]} updated"
    puts "MilkDeliveryTask   : #{changes_summary[:milk_delivery_tasks][:updated]}/#{changes_summary[:milk_delivery_tasks][:count]} updated"
    puts "CustomerFormat     : #{changes_summary[:customer_formats][:updated]}/#{changes_summary[:customer_formats][:count]} updated"
    puts "-" * 90

    total_found = changes_summary.values.sum { |v| v[:count] }
    total_updated = changes_summary.values.sum { |v| v[:updated] }
    puts "TOTAL: #{total_updated}/#{total_found} records updated successfully"

    if total_updated > 0
      puts "\n✅ All delivery_person_id updates completed successfully!"
      puts "All records previously assigned to delivery person 4 are now assigned to delivery person 8."
      puts "Transaction committed - changes are permanent."
    else
      puts "\nℹ️  No records found with delivery_person_id = 4 to update."
    end
  end

rescue => e
  puts "\n❌ Error occurred during delivery person update:"
  puts "Error: #{e.message}"
  puts "Backtrace: #{e.backtrace.first(5).join("\n")}"
  puts "\n🔄 Transaction rolled back - no changes were made."
  raise e
end

puts "\nDelivery person update script completed at #{Time.current}"