class StoreInventoryTransfer < ApplicationRecord
  belongs_to :product
  belongs_to :from_store, class_name: 'Store', optional: true
  belongs_to :to_store, class_name: 'Store'
  belongs_to :initiated_by, class_name: 'User'
  belongs_to :approved_by, class_name: 'User', optional: true

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :transfer_reference_number, uniqueness: true, allow_nil: true

  enum :status, {
    pending: 'pending',
    approved: 'approved',
    in_transit: 'in_transit',
    completed: 'completed',
    cancelled: 'cancelled',
    rejected: 'rejected'
  }

  scope :recent, -> { order(created_at: :desc) }
  scope :for_product, ->(product_id) { where(product_id: product_id) }
  scope :for_store, ->(store_id) { where('from_store_id = ? OR to_store_id = ?', store_id, store_id) }
  scope :incoming, ->(store_id) { where(to_store_id: store_id) }
  scope :outgoing, ->(store_id) { where(from_store_id: store_id) }

  before_create :generate_transfer_reference_number
  before_update :set_status_timestamps

  def self.pending_approvals
    pending.includes(:product, :from_store, :to_store, :initiated_by)
  end

  def can_be_approved?
    pending? && sufficient_inventory_available?
  end

  def can_be_cancelled?
    %w[pending approved].include?(status)
  end

  def approve!(approved_by_user)
    return false unless can_be_approved?

    ActiveRecord::Base.transaction do
      if from_store.present?
        # Allocate inventory from source store
        allocation = allocate_from_source_store
        raise "Insufficient inventory in source store" if allocation.empty?

        # Reduce inventory from source store
        allocation.each do |alloc|
          alloc[:batch].update!(
            quantity_remaining: alloc[:batch].quantity_remaining - alloc[:quantity]
          )
          if alloc[:batch].quantity_remaining <= 0
            alloc[:batch].update!(status: 'exhausted')
          end
        end

        # Create stock movement for source store
        create_stock_movement_for_transfer('outbound', from_store)
      end

      # Create new stock batch in destination store
      create_destination_stock_batch

      # Create stock movement for destination store
      create_stock_movement_for_transfer('inbound', to_store)

      update!(
        status: :approved,
        approved_by: approved_by_user,
        approved_at: Time.current
      )

      # Send notifications
      send_transfer_notifications(:approved)
    end

    true
  rescue => e
    Rails.logger.error "Failed to approve transfer #{id}: #{e.message}"
    errors.add(:base, e.message)
    false
  end

  def mark_as_shipped!(tracking_details = {})
    return false unless approved?

    update!(
      status: :in_transit,
      shipped_at: Time.current,
      tracking_number: tracking_details[:tracking_number],
      courier_details: tracking_details[:courier_details],
      estimated_delivery_days: tracking_details[:estimated_days]
    )

    send_transfer_notifications(:shipped)
    true
  end

  def complete_transfer!
    return false unless in_transit?

    update!(
      status: :completed,
      completed_at: Time.current
    )

    send_transfer_notifications(:completed)
    true
  end

  def cancel_transfer!(reason = nil)
    return false unless can_be_cancelled?

    ActiveRecord::Base.transaction do
      if approved? && from_store.present?
        # Restore inventory to source store if already allocated
        restore_inventory_to_source
      end

      update!(
        status: :cancelled,
        cancelled_at: Time.current,
        notes: [notes, "Cancelled: #{reason}"].compact.join("\n")
      )

      send_transfer_notifications(:cancelled)
    end

    true
  end

  def transfer_direction_for_store(store)
    return 'incoming' if to_store == store
    return 'outgoing' if from_store == store
    'unknown'
  end

  def status_badge_class
    case status
    when 'pending' then 'bg-warning text-dark'
    when 'approved' then 'bg-info text-white'
    when 'in_transit' then 'bg-primary text-white'
    when 'completed' then 'bg-success text-white'
    when 'cancelled', 'rejected' then 'bg-danger text-white'
    else 'bg-secondary text-white'
    end
  end

  def status_icon
    case status
    when 'pending' then 'bi-clock-history'
    when 'approved' then 'bi-check-circle'
    when 'in_transit' then 'bi-truck'
    when 'completed' then 'bi-check-all'
    when 'cancelled' then 'bi-x-circle'
    when 'rejected' then 'bi-exclamation-triangle'
    else 'bi-question-circle'
    end
  end

  def estimated_completion_date
    return nil unless shipped_at && estimated_delivery_days

    shipped_at + estimated_delivery_days.days
  end

  def total_value
    (quantity * (transfer_price || product.selling_price)).round(2)
  end

  private

  def sufficient_inventory_available?
    return true if from_store.blank? # Central inventory transfer

    from_store.available_inventory(product_id) >= quantity
  end

  def allocate_from_source_store
    return [] if from_store.blank?

    StockBatch.fifo_allocation_for_store(product_id, from_store.id, quantity)
  end

  def create_destination_stock_batch
    # Find a vendor for the transfer (use source store's vendor or default)
    vendor = if from_store&.store_admin_user&.vendors&.first
               from_store.store_admin_user.vendors.first
             else
               Vendor.find_or_create_by(name: 'Transfer Vendor') do |v|
                 v.email = 'transfer@system.com'
                 v.phone = '0000000000'
                 v.address = 'Internal Transfer'
                 v.payment_type = 'Transfer'
                 v.status = true
               end
             end

    StockBatch.create!(
      product: product,
      store: to_store,
      vendor: vendor,
      quantity_purchased: quantity,
      quantity_remaining: quantity,
      purchase_price: transfer_price || product.buying_price || product.price,
      selling_price: product.selling_price,
      batch_date: Date.current,
      status: 'active'
    )
  end

  def create_stock_movement_for_transfer(direction, store)
    movement_type = direction == 'outbound' ? 'consumed' : 'added'
    movement_quantity = direction == 'outbound' ? -quantity : quantity

    current_stock = store.available_inventory(product_id)
    new_stock = direction == 'outbound' ?
                current_stock - quantity :
                current_stock + quantity

    product.stock_movements.create!(
      store: store,
      reference_type: 'store_transfer',
      reference_id: id,
      movement_type: movement_type,
      quantity: movement_quantity,
      stock_before: current_stock,
      stock_after: new_stock,
      notes: "Store transfer #{direction}: #{product.name} from #{from_store&.name || 'Central'} to #{to_store.name}"
    )
  end

  def restore_inventory_to_source
    return unless from_store.present?

    # Create a new stock batch to restore the inventory
    vendor = from_store.store_admin_user&.vendors&.first ||
             Vendor.find_by(name: 'Transfer Vendor')

    StockBatch.create!(
      product: product,
      store: from_store,
      vendor: vendor,
      quantity_purchased: quantity,
      quantity_remaining: quantity,
      purchase_price: transfer_price || product.buying_price || product.price,
      selling_price: product.selling_price,
      batch_date: Date.current,
      status: 'active'
    )

    # Create stock movement for restoration
    current_stock = from_store.available_inventory(product_id)
    product.stock_movements.create!(
      store: from_store,
      reference_type: 'store_transfer',
      reference_id: id,
      movement_type: 'adjusted',
      quantity: quantity,
      stock_before: current_stock - quantity,
      stock_after: current_stock,
      notes: "Restored inventory from cancelled transfer: #{product.name}"
    )
  end

  def generate_transfer_reference_number
    return if transfer_reference_number.present?

    prefix = "TRF"
    date_part = Time.current.strftime("%Y%m%d")

    # Find the last transfer of the day to generate sequence
    last_transfer = StoreInventoryTransfer
                   .where("transfer_reference_number LIKE ?", "#{prefix}#{date_part}%")
                   .order(:transfer_reference_number)
                   .last

    if last_transfer
      last_sequence = last_transfer.transfer_reference_number.split(date_part).last.to_i
      sequence = sprintf("%04d", last_sequence + 1)
    else
      sequence = "0001"
    end

    self.transfer_reference_number = "#{prefix}#{date_part}#{sequence}"
  end

  def set_status_timestamps
    if status_changed?
      case status
      when 'approved'
        self.approved_at = Time.current if approved_at.blank?
      when 'in_transit'
        self.shipped_at = Time.current if shipped_at.blank?
      when 'completed'
        self.completed_at = Time.current if completed_at.blank?
      when 'cancelled', 'rejected'
        self.cancelled_at = Time.current if cancelled_at.blank?
      end
    end
  end

  def send_transfer_notifications(event)
    # TODO: Implement notification system
    # This could send emails, push notifications, etc.
    Rails.logger.info "Transfer #{transfer_reference_number} #{event}: #{product.name} from #{from_store&.name || 'Central'} to #{to_store.name}"
  end
end