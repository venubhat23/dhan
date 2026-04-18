class Admin::ProductImportsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_access!

  def new
    @categories = Category.all.order(:name)
  end

  def create
    if params[:csv_file].present?
      begin
        import_result = import_products_from_csv(params[:csv_file])

        if import_result[:success]
          flash[:success] = "Successfully imported #{import_result[:imported_count]} products. #{import_result[:updated_count]} products updated."
          redirect_to admin_products_path
        else
          flash[:error] = "Import failed: #{import_result[:error]}"
          redirect_to new_admin_product_import_path
        end
      rescue => e
        flash[:error] = "Import failed: #{e.message}"
        redirect_to new_admin_product_import_path
      end
    else
      flash[:error] = "Please select a CSV file to import."
      redirect_to new_admin_product_import_path
    end
  end

  private

  def ensure_admin_access!
    redirect_to root_path unless current_user.admin?
  end

  def import_products_from_csv(file)
    require 'csv'

    imported_count = 0
    updated_count = 0
    errors = []

    CSV.foreach(file.path, headers: true, encoding: 'utf-8') do |row|
      begin
        # Map CSV columns to our database columns based on Dhanvantri requirements
        product_data = {
          # Required fields (handle both Item and Item*)
          name: (row['Item*'] || row['Item'])&.strip,            # Item/Item* → Product Name
          category_id: parse_category_id(row['Category*'] || row['Category']), # Category/Category* → category_id

          # Core pricing fields
          buying_price: parse_decimal(row['Purchase Price']),    # Purchase Price → Buying Price (₹)
          price: parse_decimal(row['Cost Price']) || 0,          # Cost Price → Retail Price (₹) / MRP
          wholesale_price: parse_decimal(row['Wholesale Price']), # Wholesale Price → B2B Price

          # Basic product info (with defaults)
          description: row['Description']&.strip.presence,
          sku: row['SKU']&.strip.presence, # Auto-generated if blank
          stock: parse_integer(row['Stock']) || 0,
          weight: parse_decimal(row['Weight']),
          dimensions: row['Dimensions']&.strip.presence,
          unit_type: row['Unit Type']&.strip.presence || 'Piece',
          product_type: row['Product Type']&.strip.presence || 'Grocery',
          status: row['Status']&.strip.presence || 'active',

          # Pricing options
          original_price: parse_decimal(row['Original Price']),
          discount_price: parse_decimal(row['Discount Price']),
          default_selling_price: parse_decimal(row['Default Selling Price']),

          # Discount settings
          is_discounted: parse_boolean(row['Is Discounted']),
          discount_type: row['Discount Type']&.strip.presence,
          discount_value: parse_decimal(row['Discount Value']),
          discount_amount: parse_decimal(row['Discount Amount']),

          # GST configuration
          gst_enabled: parse_boolean(row['GST Enabled']),
          gst_percentage: parse_decimal(row['GST Percentage']),
          hsn_code: row['HSN Code']&.strip.presence,
          cgst_percentage: parse_decimal(row['CGST Percentage']),
          sgst_percentage: parse_decimal(row['SGST Percentage']),
          igst_percentage: parse_decimal(row['IGST Percentage']),

          # Stock management
          minimum_stock_alert: parse_integer(row['Minimum Stock Alert']),

          # SEO and marketing
          tags: row['Tags']&.strip.presence,
          meta_title: row['Meta Title']&.strip.presence,
          meta_description: row['Meta Description']&.strip.presence,
          image_url: row['Image URL']&.strip.presence,

          # Subscription options
          is_subscription_enabled: parse_boolean(row['Is Subscription Enabled']),

          # Occasional product settings
          is_occasional_product: parse_boolean(row['Is Occasional Product']),
          occasional_start_date: parse_date(row['Occasional Start Date']),
          occasional_end_date: parse_date(row['Occasional End Date']),
          occasional_description: row['Occasional Description']&.strip.presence,
          occasional_auto_hide: parse_boolean(row['Occasional Auto Hide'])
        }

        # Remove nil values to avoid database issues
        product_data = product_data.reject { |k, v| v.nil? }

        # Skip if required fields are missing
        next if product_data[:name].blank? || product_data[:category_id].blank?

        # Try to find existing product by name
        existing_product = Product.find_by(name: product_data[:name])

        if existing_product
          # Update existing product
          existing_product.update!(product_data)
          updated_count += 1
        else
          # Create new product
          Product.create!(product_data)
          imported_count += 1
        end

      rescue => e
        errors << "Row #{CSV::Row.new(row.headers, row.fields).to_s}: #{e.message}"
      end
    end

    if errors.any?
      { success: false, error: errors.first }
    else
      { success: true, imported_count: imported_count, updated_count: updated_count }
    end
  end

  def parse_decimal(value)
    return nil if value.blank?

    # Remove currency symbols and convert to decimal
    cleaned_value = value.to_s.gsub(/[₹,]/, '').strip
    return nil if cleaned_value.blank?

    Float(cleaned_value)
  rescue
    nil
  end

  def parse_integer(value)
    return nil if value.blank?
    Integer(value.to_s.strip)
  rescue
    nil
  end

  def parse_boolean(value)
    return nil if value.blank?
    ['true', 'yes', '1', 'on', 'enabled'].include?(value.to_s.strip.downcase)
  end

  def parse_date(value)
    return nil if value.blank?
    Date.parse(value.to_s.strip)
  rescue
    nil
  end

  def parse_category_id(category_value)
    return nil if category_value.blank?

    # If it's already an ID, use it
    if category_value.to_s.match?(/^\d+$/)
      return category_value.to_i
    end

    # Otherwise try to find by name
    category = Category.find_by("name ILIKE ?", category_value.strip)
    category&.id
  end
end