require 'csv'
require 'roo'

module ImportService
  class VendorImporter
    attr_reader :file, :imported_count, :skipped_count, :errors

    def initialize(file)
      @file = file
      @imported_count = 0
      @skipped_count = 0
      @errors = []
    end

    def import
      begin
        spreadsheet = open_spreadsheet(@file)
        header = spreadsheet.row(1)

        validate_headers(header)

        (2..spreadsheet.last_row).each do |i|
          # Clean headers by removing * suffix
          clean_header = header.map { |h| h.to_s.gsub('*', '').strip }
          row = Hash[[clean_header, spreadsheet.row(i)].transpose]
          process_row(row, i)
        end

        {
          success: true,
          imported_count: @imported_count,
          skipped_count: @skipped_count,
          errors: @errors
        }
      rescue => e
        {
          success: false,
          error: e.message,
          imported_count: @imported_count,
          skipped_count: @skipped_count,
          errors: @errors
        }
      end
    end

    private

    def open_spreadsheet(file)
      case File.extname(file.original_filename)
      when '.csv'
        Roo::CSV.new(file.path)
      when '.xls'
        Roo::Excel.new(file.path)
      when '.xlsx'
        Roo::Excelx.new(file.path)
      else
        raise "Unknown file type: #{file.original_filename}"
      end
    end

    def validate_headers(header)
      # Clean headers (remove * suffix and normalize)
      clean_headers = header.map(&:to_s).map { |h| h.gsub('*', '').downcase.strip }

      required_headers = %w[name phone]
      missing_headers = required_headers - clean_headers

      if missing_headers.any?
        raise "Missing required headers: #{missing_headers.join(', ')}"
      end
    end

    def process_row(row, row_number)
      # Clean and normalize data
      vendor_data = normalize_vendor_data(row)

      # Validate row data
      if !valid_row?(vendor_data, row_number)
        @skipped_count += 1
        return
      end

      # Check for duplicates
      if duplicate_vendor?(vendor_data)
        @errors << "Row #{row_number}: Vendor with name '#{vendor_data[:name]}' or phone '#{vendor_data[:phone]}' already exists"
        @skipped_count += 1
        return
      end

      # Create vendor
      vendor = Vendor.new(vendor_data)

      if vendor.save
        @imported_count += 1
      else
        @errors << "Row #{row_number}: #{vendor.errors.full_messages.join(', ')}"
        @skipped_count += 1
      end

    rescue => e
      @errors << "Row #{row_number}: #{e.message}"
      @skipped_count += 1
    end

    def normalize_vendor_data(row)
      {
        # Required fields
        name: row['name']&.to_s&.strip,
        phone: row['phone']&.to_s&.strip,

        # Optional fields
        email: row['email']&.to_s&.downcase&.strip,
        address: row['address']&.to_s&.strip,

        # Payment type and other fields
        payment_type: normalize_payment_type(row['payment_type']),
        opening_balance: parse_decimal(row['opening_balance']) || 0,
        status: parse_boolean(row['status'])
      }.compact
    end

    def valid_row?(vendor_data, row_number)
      # Check required fields
      if vendor_data[:name].blank?
        @errors << "Row #{row_number}: name is required"
        return false
      end

      if vendor_data[:phone].blank?
        @errors << "Row #{row_number}: phone is required"
        return false
      end

      # Check email format if provided
      if vendor_data[:email].present? && !vendor_data[:email].match?(URI::MailTo::EMAIL_REGEXP)
        @errors << "Row #{row_number}: Invalid email format"
        return false
      end

      # Check phone format (Indian mobile number)
      if vendor_data[:phone].present?
        clean_phone = vendor_data[:phone].gsub(/\D/, '')
        unless clean_phone.match?(/^[6-9]\d{9}$/)
          @errors << "Row #{row_number}: Invalid phone number format"
          return false
        end
        # Update phone to cleaned format
        vendor_data[:phone] = clean_phone
      end

      # GST number validation temporarily disabled (column doesn't exist in vendors table)
      # TODO: Add gst_number column to vendors table and enable this validation
      # if vendor_data[:gst_number].present?
      #   gst_number = vendor_data[:gst_number]
      #   unless gst_number.match?(/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/)
      #     @errors << "Row #{row_number}: Invalid GST number format"
      #     return false
      #   end
      # end

      # Check payment type
      if vendor_data[:payment_type].present?
        unless %w[Cash Credit].include?(vendor_data[:payment_type])
          @errors << "Row #{row_number}: Payment type must be 'Cash' or 'Credit'"
          return false
        end
      end

      true
    end

    def duplicate_vendor?(vendor_data)
      Vendor.exists?(name: vendor_data[:name]) ||
        Vendor.exists?(phone: vendor_data[:phone])
    end

    def normalize_payment_type(payment_type)
      return 'Cash' if payment_type.blank?

      case payment_type.to_s.downcase.strip
      when 'cash', 'c'
        'Cash'
      when 'credit', 'cr', 'cred'
        'Credit'
      else
        'Cash' # Default to Cash
      end
    end

    def parse_decimal(decimal_string)
      return nil if decimal_string.blank?
      BigDecimal(decimal_string.to_s)
    rescue ArgumentError
      nil
    end

    def parse_boolean(value)
      return true if value.blank? # Default to true if not specified

      case value.to_s.downcase.strip
      when 'true', '1', 'yes', 'y', 'active'
        true
      when 'false', '0', 'no', 'n', 'inactive'
        false
      else
        true # Default to true for unknown values
      end
    end
  end
end