# Quick Rails Console Script to Clear All Data Except Users
# Run this in Rails console: load 'quick_clear_data.rb'
# This version runs without confirmation for faster execution

puts "🗑️  Quick Data Cleanup - Preserving Users Only"
puts "=" * 50

# Models to clear (in dependency order)
models_to_clear = [
  # Dependencies first
  'InvoiceItem', 'BookingItem', 'OrderItem', 'MilkDeliveryTask', 'VendorPurchaseItem',
  'ProductReview', 'ProductRating', 'SaleItem', 'StockMovement', 'WalletTransaction',
  'CustomerAddress', 'CustomerDocument', 'DeviceToken', 'Wishlist', 'Notification',

  # Insurance dependencies
  'HealthInsuranceMember', 'LifeInsuranceNominee', 'LifeInsuranceDocument', 'LifeInsuranceBankDetail',
  'SubAgentDocument', 'DistributorDocument', 'InvestorDocument', 'CustomerDocument',

  # Main records
  'Invoice', 'BookingInvoice', 'Booking', 'Order', 'MilkSubscription', 'SubscriptionTemplate',
  'VendorPurchase', 'VendorPayment', 'VendorInvoice', 'StockBatch', 'CustomerWallet',
  'CustomerFormat', 'Customer', 'DeliveryPerson',

  # Products & Categories
  'Product', 'Category', 'Coupon', 'Banner', 'DeliveryRule',

  # Insurance
  'HealthInsurance', 'LifeInsurance', 'MotorInsurance', 'OtherInsurance', 'InsuranceCompany',

  # Business network
  'Lead', 'Referral', 'Affiliate', 'Franchise', 'Distributor', 'SubAgent', 'Investor',
  'DistributorAssignment', 'AgencyCode', 'AgencyBroker', 'Broker',

  # Financial
  'CommissionPayout', 'CommissionReceipt', 'Payout', 'PayoutDistribution', 'PayoutAuditLog',
  'DistributorPayout', 'Investment',

  # Services & Others
  'TaxService', 'Loan', 'TravelPackage', 'ClientRequest', 'Report', 'Document',
  'FamilyMember', 'CorporateMember', 'Message', 'Store', 'Vendor',

  # System (be careful with these)
  'SystemSetting'
]

total_deleted = 0
errors = []

ActiveRecord::Base.transaction do
  models_to_clear.each do |model_name|
    begin
      model_class = model_name.constantize
      count = model_class.count

      if count > 0
        deleted = model_class.delete_all
        total_deleted += deleted
        puts "✅ #{model_name}: #{deleted} deleted"
      else
        puts "⭕ #{model_name}: already empty"
      end
    rescue NameError
      puts "⚠️  #{model_name}: model not found"
    rescue => e
      error_msg = "❌ #{model_name}: #{e.message}"
      puts error_msg
      errors << error_msg
    end
  end
end

# Reset sequences for PostgreSQL
if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
  puts "\n🔧 Resetting sequences..."
  models_to_clear.each do |model_name|
    begin
      model_class = model_name.constantize
      table_name = model_class.table_name
      ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table_name}_id_seq RESTART WITH 1;")
    rescue
      # Ignore sequence errors
    end
  end
end

puts "\n" + "=" * 50
puts "📊 SUMMARY:"
puts "Total records deleted: #{total_deleted}"
puts "Users preserved: #{User.count rescue 0}"
puts "Roles preserved: #{Role.count rescue 0}"
puts "Permissions preserved: #{Permission.count rescue 0}"

if errors.any?
  puts "\n⚠️  ERRORS:"
  errors.each { |error| puts error }
end

puts "\n🎉 Quick cleanup completed!"
puts "🔐 All user authentication data preserved"