class Invoice < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: true
  has_many :invoice_items, dependent: :destroy

  accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: :all_blank

  enum :status, { draft: 'draft', sent: 'sent', paid: 'paid', overdue: 'overdue', cancelled: 'cancelled' }
  enum :payment_status, { unpaid: 0, partially_paid: 1, fully_paid: 2 }

  validates :invoice_number, presence: true, uniqueness: true
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :invoice_date, presence: true

  before_validation :generate_invoice_number, on: :create
  before_validation :calculate_total_from_items
  before_create :generate_share_token

  scope :for_month, ->(month, year) { where(invoice_date: Date.new(year, month).beginning_of_month..Date.new(year, month).end_of_month) }

  # Get customer display name (customer or walk-in from booking)
  def customer_display_name
    return customer.display_name if customer.present?

    # For walk-in customers, get name from related booking
    related_booking = Booking.find_by(invoice_number: invoice_number)
    return related_booking.customer_name if related_booking&.customer_name.present?

    'Walk-in Customer'
  end

  # Get customer address (customer or walk-in from booking)
  def customer_address
    return customer.address if customer&.address.present?

    # For walk-in customers, get address from related booking
    related_booking = Booking.find_by(invoice_number: invoice_number)
    return related_booking.delivery_address if related_booking&.delivery_address.present?

    'Walk-in Address'
  end

  # Get customer mobile (customer or walk-in from booking)
  def customer_mobile
    return customer.mobile if customer&.mobile.present?

    # For walk-in customers, get mobile from related booking
    related_booking = Booking.find_by(invoice_number: invoice_number)
    return related_booking.customer_phone if related_booking&.customer_phone.present?

    nil
  end

  def generate_share_token!
    self.share_token = SecureRandom.urlsafe_base64(32)
    save!
  end

  def formatted_number
    invoice_number
  end

  def customer_name
    "#{customer&.first_name} #{customer&.last_name}".strip
  end

  def customer_phone
    customer&.mobile
  end

  def customer_email
    customer&.email
  end

  def overdue?
    due_date && due_date < Date.current && payment_status != 'fully_paid'
  end

  def remaining_amount
    total_amount - (paid_amount || 0)
  end

  def paid_percentage
    return 0 if total_amount.zero?
    ((paid_amount || 0) / total_amount * 100).round(2)
  end

  def fully_paid?
    payment_status == 'fully_paid' || remaining_amount <= 0
  end

  def partially_paid?
    payment_status == 'partially_paid' || (paid_amount && paid_amount > 0 && paid_amount < total_amount)
  end

  private

  def generate_invoice_number
    return if invoice_number.present?

    # Get the date to work with
    current_date = invoice_date || Date.current

    # Calculate financial year (April to March)
    if current_date.month >= 4
      # April to March of next year
      fy_start_year = current_date.year
      fy_end_year = current_date.year + 1
    else
      # January to March of current year (belongs to previous FY)
      fy_start_year = current_date.year - 1
      fy_end_year = current_date.year
    end

    # Format: DN + last2digits_of_start_year + last2digits_of_end_year + month + sequential_number
    fy_start_suffix = fy_start_year.to_s.last(2)
    fy_end_suffix = fy_end_year.to_s.last(2)
    month_part = current_date.month.to_s.rjust(2, '0')

    # Create the pattern for this financial year and month
    pattern_prefix = "DN#{fy_start_suffix}#{fy_end_suffix}#{month_part}"

    # Find the last invoice with this pattern (checking both Invoice and BookingInvoice tables)
    last_invoice_regular = Invoice.where("invoice_number LIKE ?", "#{pattern_prefix}%")
                                  .order(created_at: :desc)
                                  .first

    last_booking_invoice = BookingInvoice.where("invoice_number LIKE ?", "#{pattern_prefix}%")
                                        .order(created_at: :desc)
                                        .first

    # Find the highest number from both tables
    last_numbers = []
    last_numbers << last_invoice_regular.invoice_number.gsub(pattern_prefix, '').to_i if last_invoice_regular
    last_numbers << last_booking_invoice.invoice_number.gsub(pattern_prefix, '').to_i if last_booking_invoice

    if last_numbers.any?
      next_number = last_numbers.max + 1
    else
      # Start from 1 for this pattern
      next_number = 1
    end

    self.invoice_number = "#{pattern_prefix}#{next_number}"
  end

  # Helper method to generate month-based invoice number for specific month
  def self.generate_invoice_number_for_month(month)
    month_prefix = month.to_s.rjust(2, '0')

    last_invoice = where("invoice_number LIKE ?", "INV-#{month_prefix}-%")
                   .order(created_at: :desc)
                   .first

    if last_invoice
      last_number = last_invoice.invoice_number.split('-').last.to_i
      next_number = (last_number + 1).to_s.rjust(5, '0')
    else
      next_number = '00001'
    end

    "INV-#{month_prefix}-#{next_number}"
  end

  def generate_share_token
    return if share_token.present?
    self.share_token = SecureRandom.urlsafe_base64(32)
  end

  private

  def calculate_total_from_items
    # Only recalculate if invoice_items are present and changed
    if invoice_items.any? || (respond_to?(:invoice_items_attributes) && invoice_items_attributes.present?)
      new_total = 0

      # Calculate from existing items
      invoice_items.each do |item|
        next if item.marked_for_destruction?
        new_total += (item.quantity || 0) * (item.unit_price || 0)
      end

      # Add new items from nested attributes if present
      if respond_to?(:invoice_items_attributes) && invoice_items_attributes.present?
        invoice_items_attributes.each do |_, attrs|
          next if attrs['_destroy'] == '1' || attrs[:_destroy] == '1'
          next if attrs['id'].present? || attrs[:id].present? # Skip existing items already counted

          quantity = (attrs['quantity'] || attrs[:quantity] || 0).to_f
          unit_price = (attrs['unit_price'] || attrs[:unit_price] || 0).to_f
          new_total += quantity * unit_price
        end
      end

      self.total_amount = new_total if new_total > 0
    end
  end
end
