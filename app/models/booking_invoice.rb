class BookingInvoice < ApplicationRecord
  belongs_to :booking
  belongs_to :customer, optional: true

  # Enums
  enum :payment_status, {
    unpaid: 0,
    paid: 1,
    partially_paid: 2,
    refunded: 3
  }, prefix: true

  enum :status, {
    draft: 0,
    sent: 1,
    viewed: 2,
    overdue: 3,
    cancelled: 4
  }

  # Validations
  validates :invoice_number, presence: true, uniqueness: true
  validates :invoice_date, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Callbacks
  before_validation :generate_invoice_number, on: :create
  before_validation :set_defaults, on: :create
  before_validation :generate_share_token, on: :create

  # Scopes
  scope :recent, -> { order(created_at: :desc) }
  scope :pending_payment, -> { where(payment_status: [:unpaid, :partially_paid]) }
  scope :overdue_invoices, -> { where('due_date < ? AND payment_status IN (?)', Date.current, [:unpaid, :partially_paid]) }

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

  def set_defaults
    self.invoice_date ||= Time.current
    self.due_date ||= 30.days.from_now
    self.status ||= :draft

    if booking.present?
      self.customer_id ||= booking.customer_id
      self.subtotal ||= booking.subtotal
      self.tax_amount ||= booking.tax_amount
      self.discount_amount ||= booking.discount_amount
      self.total_amount ||= booking.total_amount
      self.payment_status ||= booking.payment_status

      # Store invoice items as JSON
      self.invoice_items ||= build_invoice_items_json
    end
  end

  def build_invoice_items_json
    return nil unless booking&.booking_items&.any?

    items = booking.booking_items.includes(:product).map do |item|
      {
        product_id: item.product_id,
        product_name: item.product&.name || 'Unknown Product',
        quantity: item.quantity,
        price: item.price,
        total: item.quantity * item.price
      }
    end

    JSON.generate(items)
  end

  def parsed_invoice_items
    return [] if invoice_items.blank?

    JSON.parse(invoice_items)
  rescue JSON::ParserError
    []
  end

  def mark_as_paid!
    update!(
      payment_status: :paid,
      paid_at: Time.current,
      status: :sent
    )
  end

  def mark_as_partially_paid!(amount_paid)
    remaining = total_amount - amount_paid

    update!(
      payment_status: remaining > 0 ? :partially_paid : :paid,
      paid_at: remaining <= 0 ? Time.current : nil
    )
  end

  def overdue?
    due_date < Date.current && payment_status_unpaid?
  end

  def days_overdue
    return 0 unless overdue?
    (Date.current - due_date.to_date).to_i
  end

  def formatted_total
    "₹#{total_amount.to_f.round(2)}"
  end

  def customer_name
    customer&.display_name || booking&.customer_name || 'Unknown Customer'
  end

  def customer_email
    customer&.email || booking&.customer_email
  end

  def customer_phone
    customer&.mobile || booking&.customer_phone
  end

  def payment_status_display
    case payment_status
    when 'unpaid' then 'Unpaid'
    when 'paid' then 'Paid'
    when 'partially_paid' then 'Partially Paid'
    when 'refunded' then 'Refunded'
    else 'Unpaid'
    end
  end

  def generate_share_token
    return if share_token.present?

    loop do
      token = SecureRandom.urlsafe_base64(32)
      break self.share_token = token unless BookingInvoice.exists?(share_token: token)
    end
  end

  def formatted_number
    invoice_number
  end
end
