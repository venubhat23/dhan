class Store < ApplicationRecord
  # Constants
  MAX_STORES_LIMIT = 100

  # Associations
  has_many :bookings, dependent: :restrict_with_error
  belongs_to :store_admin_user, class_name: 'User', optional: true
  has_many :store_staff, class_name: 'User', foreign_key: 'assigned_store_id', dependent: :nullify
  has_many :stock_batches, dependent: :restrict_with_error
  has_many :stock_movements, dependent: :restrict_with_error
  has_many :outgoing_transfers, class_name: 'StoreInventoryTransfer', foreign_key: 'from_store_id', dependent: :destroy
  has_many :incoming_transfers, class_name: 'StoreInventoryTransfer', foreign_key: 'to_store_id', dependent: :destroy
  has_many :expenses, dependent: :destroy

  # Virtual attributes for store creation form
  attr_accessor :admin_username, :admin_email, :admin_password, :admin_first_name, :admin_last_name, :admin_mobile
  attr_accessor :create_admin_user, :initial_inventory_allocations

  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 500 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :state, presence: true, length: { maximum: 50 }
  validates :pincode, presence: true, format: { with: /\A\d{6}\z/, message: "should be 6 digits" }
  validates :contact_mobile, presence: true
  validate :validate_indian_mobile_number
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :contact_person, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :gst_no, format: { with: /\A[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}\z/, message: "should be valid GST number format (15 characters)" }, allow_blank: true

  # Custom validation for maximum stores limit
  validate :check_maximum_stores_limit, on: :create
  validate :validate_admin_details, if: :create_admin_user
  validate :validate_inventory_allocations

  # Callbacks
  before_validation :normalize_contact_mobile

  # Scopes
  scope :active, -> { where(status: true) }
  scope :inactive, -> { where(status: false) }
  scope :by_display_order, -> { order(:name) }

  # Class methods
  def self.available_for_collection
    active.by_display_order
  end

  def self.can_add_more_stores?
    Store.count < MAX_STORES_LIMIT
  end

  def self.remaining_store_slots
    MAX_STORES_LIMIT - Store.count
  end

  # Instance methods
  def display_name
    "#{name} - #{city}"
  end

  def full_address
    [address, city, state, pincode].compact.join(', ')
  end

  def contact_info
    info = [contact_person, contact_mobile]
    info << email if email.present?
    info.join(' | ')
  end

  def can_be_deleted?
    bookings.count == 0 && stock_batches.count == 0
  end

  # Store-specific inventory methods
  def available_inventory(product_id)
    stock_batches.joins(:product)
                 .where(product_id: product_id, status: 'active')
                 .sum(:quantity_remaining)
  end

  def store_products_with_inventory
    Product.joins(:stock_batches)
           .where(stock_batches: { store_id: id, status: 'active' })
           .where('stock_batches.quantity_remaining > 0')
           .distinct
           .includes(:category)
  end

  def low_stock_products(threshold = nil)
    threshold ||= auto_transfer_threshold || 10
    products_with_low_stock = []

    store_products_with_inventory.each do |product|
      available = available_inventory(product.id)
      if available <= threshold
        products_with_low_stock << {
          product: product,
          available: available,
          threshold: threshold,
          shortage: threshold - available
        }
      end
    end
    products_with_low_stock
  end

  def store_inventory_summary
    {
      total_products: store_products_with_inventory.count,
      total_stock_value: calculate_total_inventory_value,
      low_stock_count: low_stock_products.count,
      pending_incoming_transfers: incoming_transfers.pending.count,
      pending_outgoing_transfers: outgoing_transfers.pending.count,
      recent_bookings_count: bookings.where(created_at: 1.week.ago..Time.current).count
    }
  end

  def daily_sales_summary(date = Date.current)
    bookings.where(created_at: date.beginning_of_day..date.end_of_day)
            .where.not(status: ['cancelled', 'returned'])
            .sum(:total_amount)
  end

  def has_store_admin?
    store_admin_user.present?
  end

  def transfer_history(limit = 10)
    all_transfers = StoreInventoryTransfer
                   .where('from_store_id = ? OR to_store_id = ?', id, id)
                   .recent
                   .limit(limit)
                   .includes(:product, :from_store, :to_store, :initiated_by)
    all_transfers
  end

  def can_fulfill_order?(product_id, quantity)
    available_inventory(product_id) >= quantity
  end

  def products_needing_restock
    low_stock_products.map { |item| item[:product] }
  end

  # Store creation with admin and inventory
  def create_with_admin_and_inventory!
    return false unless valid?

    ActiveRecord::Base.transaction do
      # Save the store first
      save!

      # Create admin user if requested
      if create_admin_user && admin_email.present?
        create_store_admin_user!
      end

      # Transfer initial inventory if specified
      if initial_inventory_allocations.present?
        transfer_initial_inventory!
      end
    end

    true
  rescue ActiveRecord::RecordInvalid => e
    # Add errors from failed saves to this object
    if e.record == self
      false
    else
      # If the error is from another model (like User), add a generic error
      errors.add(:base, "Failed to create store: #{e.message}")
      false
    end
  rescue StandardError => e
    errors.add(:base, "An error occurred while creating the store: #{e.message}")
    false
  end

  def available_products_for_allocation
    Product.joins(:stock_batches)
           .where(stock_batches: { status: 'active', store_id: nil })
           .where('stock_batches.quantity_remaining > 0')
           .group('products.id')
           .having('SUM(stock_batches.quantity_remaining) > 0')
           .includes(:category)
  end

  def central_inventory_for_product(product_id)
    StockBatch.where(product_id: product_id, store_id: nil, status: 'active')
              .sum(:quantity_remaining)
  end

  def store_inventory_for_product(product_id)
    return 0 if new_record?

    stock_batches.where(product_id: product_id, status: 'active')
                 .sum(:quantity_remaining)
  end

  private

  def calculate_total_inventory_value
    stock_batches.active
                 .joins(:product)
                 .sum('stock_batches.quantity_remaining * stock_batches.purchase_price')
  end

  def check_maximum_stores_limit
    if Store.count >= MAX_STORES_LIMIT
      errors.add(:base, "Maximum #{MAX_STORES_LIMIT} stores allowed. Cannot add more stores.")
    end
  end

  def validate_admin_details
    if create_admin_user
      errors.add(:admin_username, "can't be blank") if admin_username.blank?
      errors.add(:admin_password, "can't be blank") if admin_password.blank?
      errors.add(:admin_first_name, "can't be blank") if admin_first_name.blank?
      errors.add(:admin_last_name, "can't be blank") if admin_last_name.blank?
      errors.add(:admin_mobile, "can't be blank") if admin_mobile.blank?

      # Require manual email entry - no auto-generation
      if admin_email.blank?
        errors.add(:admin_email, "can't be blank")
      end

      # Only validate uniqueness if creating a new admin user (not when updating store with existing admin)
      if admin_email.present? && User.exists?(email: admin_email) && !store_admin_user&.email&.eql?(admin_email)
        errors.add(:admin_email, "already exists")
      end

      # Store admin mobile without validation
      if admin_mobile.present?
        # Check uniqueness only
        if User.exists?(mobile: admin_mobile) && !store_admin_user&.mobile&.eql?(admin_mobile)
          errors.add(:admin_mobile, "already exists")
        end
      end

      if admin_password.present? && admin_password.length < 6
        errors.add(:admin_password, "must be at least 6 characters")
      end
    end
  end

  def validate_inventory_allocations
    return unless initial_inventory_allocations.present?

    initial_inventory_allocations.each do |product_id, allocation_data|
      next if allocation_data['quantity'].blank? || allocation_data['quantity'].to_f <= 0

      product = Product.find_by(id: product_id)
      unless product
        errors.add(:base, "Product not found")
        next
      end

      available = central_inventory_for_product(product_id)
      requested = allocation_data['quantity'].to_f

      if requested > available
        errors.add(:base, "#{product.name}: Requested #{requested} but only #{available} available in central inventory")
      end
    end
  end

  def create_store_admin_user!
    # Comprehensive sidebar permissions for admin access
    sidebar_permissions = {
      'dashboard' => { 'view' => true },
      'stores' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'products' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'categories' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'inventory' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'stock_batches' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'stock_movements' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'vendors' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'bookings' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'orders' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'customers' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'invoices' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true },
      'reports' => { 'view' => true },
      'settings' => { 'view' => true, 'update' => true },
      'users' => { 'view' => true, 'create' => true, 'update' => true, 'delete' => true }
    }

    user = User.create!(
      first_name: admin_first_name,
      last_name: admin_last_name,
      email: admin_email,
      mobile: admin_mobile,
      password: admin_password,
      password_confirmation: admin_password,
      user_type: 'store_admin',  # Store admin for store-specific access
      assigned_store: self,
      sidebar_permissions: sidebar_permissions.to_json,
      permissions: 'all',  # Full permissions
      store_permissions: {
        'can_manage_inventory' => true,
        'can_create_bookings' => true,
        'can_view_reports' => true,
        'can_request_transfers' => true,
        'can_approve_transfers' => true  # Give full permissions
      },
      status: true,
      is_active: true,
      is_verified: true
    )

    # Save the plain text password for display purposes
    update!(store_admin_user: user, admin_plain_password: admin_password)
    user
  end

  def transfer_initial_inventory!
    return unless initial_inventory_allocations.present?

    initial_inventory_allocations.each do |product_id, allocation_data|
      quantity = allocation_data['quantity'].to_f
      next if quantity <= 0

      product = Product.find(product_id)

      # Create transfer record for audit trail
      transfer = StoreInventoryTransfer.create!(
        product: product,
        from_store: nil, # Central inventory
        to_store: self,
        quantity: quantity,
        initiated_by: User.where(user_type: 'admin').first,
        status: 'completed',
        initiated_at: Time.current,
        approved_at: Time.current,
        completed_at: Time.current,
        transfer_reference_number: "INITIAL#{id}#{product_id}#{Time.current.to_i}",
        notes: "Initial inventory allocation for new store: #{name}"
      )

      # Transfer inventory from central (nil store_id) to this store
      transfer_inventory_from_central(product, quantity)

      Rails.logger.info "Transferred #{quantity} units of #{product.name} to store #{name}"
    end
  end

  def transfer_inventory_from_central(product, quantity)
    remaining_to_transfer = quantity

    # Get central inventory batches (store_id = nil) using FIFO
    central_batches = StockBatch.where(
      product: product,
      store_id: nil,
      status: 'active'
    ).where('quantity_remaining > 0').order(:batch_date, :created_at)

    central_batches.each do |batch|
      break if remaining_to_transfer <= 0

      # Determine how much to take from this batch
      quantity_from_batch = [remaining_to_transfer, batch.quantity_remaining].min

      # Reduce central inventory
      batch.update!(
        quantity_remaining: batch.quantity_remaining - quantity_from_batch
      )

      # Mark as exhausted if empty
      batch.update!(status: 'exhausted') if batch.quantity_remaining <= 0

      # Create new batch for this store
      StockBatch.create!(
        product: product,
        vendor: batch.vendor,
        store: self,
        quantity_purchased: quantity_from_batch,
        quantity_remaining: quantity_from_batch,
        purchase_price: batch.purchase_price,
        selling_price: batch.selling_price,
        batch_date: Date.current,
        status: 'active'
      )

      # Create stock movements for audit trail
      create_transfer_stock_movements(product, quantity_from_batch, batch)

      remaining_to_transfer -= quantity_from_batch
    end

    if remaining_to_transfer > 0
      raise StandardError, "Could not transfer full quantity. Missing #{remaining_to_transfer} units."
    end
  end

  def create_transfer_stock_movements(product, quantity, original_batch)
    # Movement for central inventory (reduction)
    StockMovement.create!(
      product: product,
      store: nil, # Central inventory
      reference_type: 'store_transfer',
      reference_id: id,
      movement_type: 'consumed',
      quantity: -quantity,
      stock_before: original_batch.quantity_remaining + quantity,
      stock_after: original_batch.quantity_remaining,
      notes: "Transferred #{quantity} units to store: #{name}"
    )

    # Movement for destination store (addition)
    StockMovement.create!(
      product: product,
      store: self,
      reference_type: 'store_transfer',
      reference_id: id,
      movement_type: 'added',
      quantity: quantity,
      stock_before: 0,
      stock_after: quantity,
      notes: "Received #{quantity} units from central inventory"
    )
  end

  def normalize_contact_mobile
    return unless contact_mobile.present?
    self.contact_mobile = normalize_mobile_number(contact_mobile)
  end

  def normalize_mobile_number(mobile)
    return nil unless mobile.present?

    # Remove all non-digit characters
    normalized = mobile.gsub(/\D/, '')

    # Handle various formats
    case normalized.length
    when 10
      # Already 10 digits, return as is
      normalized
    when 11
      # Starts with 0 (remove the leading 0)
      normalized.start_with?('0') ? normalized[1..10] : nil
    when 12
      # Starts with 91 (remove country code)
      normalized.start_with?('91') ? normalized[2..11] : nil
    when 13
      # Starts with +91 format
      normalized.start_with?('91') ? normalized[2..11] : nil
    else
      nil
    end
  end

  def validate_indian_mobile_number
    return unless contact_mobile.present?

    # After normalization, check if it's a valid 10-digit Indian number
    unless contact_mobile.match?(/\A[6-9]\d{9}\z/)
      errors.add(:contact_mobile, "should be a valid Indian mobile number")
    end
  end
end
