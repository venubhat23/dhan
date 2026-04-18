require 'csv'
require 'roo'
require 'bcrypt'

module ImportService
  class DhanvantriCustomerImporter
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
      when '.csv' then Roo::CSV.new(file.path, encoding: 'utf-8')
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end

    def validate_headers(header)
      required_headers = ['Name', 'Number']

      required_headers.each do |required_header|
        header_found = header.any? do |h|
          cleaned = h.to_s.gsub('*', '').strip
          cleaned.downcase == required_header.downcase
        end

        unless header_found
          raise "Required header '#{required_header}*' not found. Please ensure your CSV has the required columns."
        end
      end
    end

    def process_row(row, row_number)
      begin
        # Required fields mapping
        name = row['Name']&.to_s&.strip
        mobile = row['Number']&.to_s&.strip

        # Skip if required fields are missing
        if name.blank? || mobile.blank?
          @skipped_count += 1
          @errors << "Row #{row_number}: Missing required fields (Name or Number)"
          return
        end

        # Optional fields mapping
        alternate_number = row['Alternate Number']&.to_s&.strip
        whatsapp_no = row['WhatsApp No']&.to_s&.strip
        gender = row['Gender']&.to_s&.strip&.downcase
        gst_number = row['GST Number']&.to_s&.strip
        address = row['Address']&.to_s&.strip
        location = row['Location']&.to_s&.strip
        email = row['Email']&.to_s&.strip

        # Check if customer already exists by mobile
        existing_customer = Customer.find_by(mobile: mobile)
        if existing_customer
          @skipped_count += 1
          @errors << "Row #{row_number}: Customer with mobile #{mobile} already exists"
          return
        end

        # Split name into first_name and last_name
        name_parts = name.split(' ', 2)
        first_name = name_parts[0]
        last_name = name_parts[1] || ''

        # Create customer attributes hash
        customer_attributes = {
          first_name: first_name,
          last_name: last_name,
          mobile: mobile,
          email: email.present? ? email : nil,
          address: address.present? ? address : nil,
          whatsapp_number: whatsapp_no.present? ? whatsapp_no : nil,
          gender: gender.present? && %w[male female other].include?(gender) ? gender : nil,
          gst_no: gst_number.present? ? gst_number : nil,
          emergency_contact_number: alternate_number.present? ? alternate_number : nil,
          notes: location.present? ? "Location: #{location}" : nil,
          status: true
        }

        # Create the customer
        customer = Customer.new(customer_attributes)

        if customer.save
          @imported_count += 1
        else
          @skipped_count += 1
          error_messages = customer.errors.full_messages.join(', ')
          @errors << "Row #{row_number}: #{error_messages}"
        end

      rescue => e
        @skipped_count += 1
        @errors << "Row #{row_number}: #{e.message}"
      end
    end
  end
end