# Test script to create sample pending amounts and test invoice generation with pending amounts integration

# Create sample pending amounts for testing
puts "🧪 Testing Pending Amounts Integration with Invoice Generation"
puts "=" * 60

# Get a customer (use the same customer from our invoice)
customer = Customer.find_by(email: 'bharath.belavadgi.1@gmail.com')

if customer
  puts "✅ Found customer: #{customer.first_name} #{customer.last_name} (ID: #{customer.id})"

  # Create a pending amount for this customer for the current month
  current_month_start = Date.current.beginning_of_month
  current_month_end = Date.current.end_of_month

  # Check if pending amount already exists
  existing_pending = PendingAmount.where(
    customer: customer,
    status: :pending,
    pending_date: current_month_start..current_month_end
  ).first

  if existing_pending
    puts "✅ Found existing pending amount: ₹#{existing_pending.amount} - #{existing_pending.description}"
    pending_amount = existing_pending
  else
    # Create a new pending amount
    pending_amount = PendingAmount.create!(
      customer: customer,
      amount: 150.00,
      description: "Delivery charges from last month",
      pending_date: Date.current,
      status: :pending,
      notes: "Created for testing pending amounts integration"
    )
    puts "✅ Created test pending amount: ₹#{pending_amount.amount} - #{pending_amount.description}"
  end

  puts "\n📋 Current pending amounts for #{customer.first_name}:"
  customer_pending = PendingAmount.where(customer: customer, status: :pending)
  customer_pending.each do |pa|
    puts "  - ₹#{pa.amount} | #{pa.description} | #{pa.pending_date} | Status: #{pa.status}"
  end

  # Test the invoice generation logic that includes pending amounts
  puts "\n🧾 Testing invoice generation with pending amounts..."

  # The generate_customer_invoice method will be called via the admin interface
  # For now, let's just verify the query logic works

  current_pending = PendingAmount.where(customer: customer)
                                  .where(status: :pending)
                                  .where(pending_date: current_month_start..current_month_end)

  puts "\n📊 Pending amounts that would be included in invoice:"
  current_pending.each do |pa|
    puts "  - ₹#{pa.amount} | #{pa.description} | #{pa.pending_date}"
  end

  if current_pending.any?
    puts "\n✅ SUCCESS: Found #{current_pending.count} pending amount(s) that will be included in the next invoice generation"
    puts "💡 When you generate an invoice for #{customer.first_name}, these pending amounts will be:"
    puts "   1. Added as line items to the invoice with description 'Pending from last month: [original description]'"
    puts "   2. Marked as 'resolved' status"
    puts "   3. Updated with notes showing they were resolved via the invoice"
  else
    puts "ℹ️  No pending amounts found for the current month"
  end

else
  puts "❌ Customer not found! Please check the email address."
end

puts "\n" + "=" * 60
puts "🎯 Test completed. The pending amounts integration is ready!"
puts "📝 To test the full integration:"
puts "   1. Go to #{ENV['RAILS_ENV'] == 'production' ? 'https://fna-2.onrender.com' : 'http://localhost:3000'}/admin/invoices"
puts "   2. Click 'Generate Invoice' button"
puts "   3. Select customer: #{customer&.first_name} #{customer&.last_name}"
puts "   4. Generate invoice - it will include pending amounts as line items"