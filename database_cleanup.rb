#!/usr/bin/env ruby

# Database cleanup script
# This script will keep only a specified number of records per model
# and handle dependent records properly

require_relative 'config/environment'

class DatabaseCleanup
  def initialize
    @models_to_keep = {
      'Product' => 20,          # Keep 20 products as requested
      'ProductReview' => 10,
      'ProductRating' => 10,
      'Category' => 10,
      'Customer' => 10,
      'User' => 10,
      'Booking' => 10,
      'BookingItem' => 10,
      'BookingSchedule' => 10,
      'BookingInvoice' => 10,
      'Order' => 10,
      'OrderItem' => 10,
      'Invoice' => 10,
      'InvoiceItem' => 10,
      'SaleItem' => 10
    }

    # Models that should be cleaned but with default 10 records
    @default_keep_count = 10

    # Models to skip (critical system data)
    @skip_models = %w[
      ApplicationRecord
      Ability
      Role
      Permission
      RolePermission
      UserRole
      SystemSetting
    ]
  end

  def run
    puts "=" * 80
    puts "DATABASE CLEANUP SCRIPT"
    puts "This will keep only specified number of records per model"
    puts "=" * 80

    # Get all model classes
    models = get_all_models

    puts "\nFound #{models.length} models to process"
    puts "\nStarting cleanup..."
    puts "-" * 60

    ActiveRecord::Base.transaction do
      # Process models in order of dependencies
      # First clean child records, then parent records

      # Clean dependent models first
      clean_dependent_models(models)

      # Then clean main models
      clean_main_models(models)
    end

    puts "\n" + "=" * 60
    puts "DATABASE CLEANUP COMPLETED!"
    show_final_counts(models)
    puts "=" * 60
  end

  private

  def get_all_models
    models = []
    Dir.glob(Rails.root.join('app/models/*.rb')).each do |file|
      model_name = File.basename(file, '.rb').camelize
      next if @skip_models.include?(model_name)

      begin
        klass = model_name.constantize
        if klass < ApplicationRecord && klass.table_exists?
          models << klass
        end
      rescue => e
        puts "Skipping #{model_name}: #{e.message}"
      end
    end
    models
  end

  def clean_dependent_models(models)
    # Order matters - clean child records before parent records
    dependent_order = [
      'InvoiceItem', 'BookingItem', 'OrderItem', 'SaleItem',
      'VendorPurchaseItem', 'BookingSchedule', 'BookingInvoice',
      'ProductReview', 'ProductRating', 'Wishlist',
      'CustomerAddress', 'CustomerDocument', 'CustomerWallet',
      'WalletTransaction', 'DeviceToken', 'Notification',
      'MilkDeliveryTask', 'StockMovement', 'StockBatch',
      'DistributorAssignment', 'CommissionPayout', 'DistributorPayout',
      'PayoutDistribution', 'PayoutAuditLog', 'CommissionReceipt',
      'VendorPayment', 'PendingAmount', 'Referral'
    ]

    dependent_order.each do |model_name|
      model = models.find { |m| m.name == model_name }
      next unless model

      clean_model(model)
    end
  end

  def clean_main_models(models)
    # Clean remaining models
    models.each do |model|
      clean_model(model) unless already_cleaned?(model)
    end
  end

  def clean_model(model)
    begin
      total_count = model.count
      keep_count = @models_to_keep[model.name] || @default_keep_count

      if total_count <= keep_count
        puts "#{model.name}: #{total_count} records (no cleanup needed)"
        return
      end

      puts "#{model.name}: #{total_count} records -> keeping #{keep_count}"

      # Get IDs to keep (oldest records by ID)
      keep_ids = model.order(:id).limit(keep_count).pluck(:id)

      # Delete records not in keep list
      deleted_count = model.where.not(id: keep_ids).delete_all

      puts "  ✓ Deleted #{deleted_count} records"
      @cleaned_models ||= []
      @cleaned_models << model.name

    rescue => e
      puts "  ✗ Error cleaning #{model.name}: #{e.message}"
    end
  end

  def already_cleaned?(model)
    @cleaned_models ||= []
    @cleaned_models.include?(model.name)
  end

  def show_final_counts(models)
    puts "\nFINAL RECORD COUNTS:"
    puts "-" * 40

    total_records = 0
    models.sort_by(&:name).each do |model|
      begin
        count = model.count
        total_records += count
        status = count <= (@models_to_keep[model.name] || @default_keep_count) ? "✓" : "!"
        puts "#{status} #{model.name}: #{count} records"
      rescue => e
        puts "✗ #{model.name}: Error - #{e.message}"
      end
    end

    puts "-" * 40
    puts "Total records across all models: #{total_records}"
  end
end

# Run the cleanup
if __FILE__ == $0
  puts "Starting database cleanup..."
  puts "Press CTRL+C to cancel or ENTER to continue..."

  begin
    STDIN.gets
    DatabaseCleanup.new.run
  rescue Interrupt
    puts "\nCleanup cancelled by user"
    exit 1
  end
end