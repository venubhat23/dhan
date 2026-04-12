class Expense < ApplicationRecord
  belongs_to :store, optional: true
  belongs_to :created_by, class_name: 'User'

  validates :title, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :expense_date, presence: true
  validates :category, presence: true
  validate :store_or_main_inventory_present

  CATEGORIES = [
    'Rent & Utilities',
    'Staff Salaries',
    'Inventory Purchase',
    'Equipment & Maintenance',
    'Marketing & Advertising',
    'Transportation',
    'Office Supplies',
    'Professional Services',
    'Insurance',
    'Withdrawal for Self',
    'Withdrawal for Owner Consumption',
    'Miscellaneous'
  ].freeze

  scope :for_store, ->(store_id) { where(store_id: store_id) }
  scope :main_inventory, -> { where(is_main_inventory: true) }
  scope :store_only, -> { where(is_main_inventory: false) }
  scope :by_date_range, ->(start_date, end_date) { where(expense_date: start_date..end_date) }
  scope :by_category, ->(category) { where(category: category) }
  scope :recent, -> { order(expense_date: :desc, created_at: :desc) }

  def formatted_amount
    "₹#{amount.to_f.round(2)}"
  end

  def category_icon
    case category
    when 'Rent & Utilities'
      'bi bi-building'
    when 'Staff Salaries'
      'bi bi-people'
    when 'Inventory Purchase'
      'bi bi-boxes'
    when 'Equipment & Maintenance'
      'bi bi-tools'
    when 'Marketing & Advertising'
      'bi bi-megaphone'
    when 'Transportation'
      'bi bi-truck'
    when 'Office Supplies'
      'bi bi-pencil'
    when 'Professional Services'
      'bi bi-briefcase'
    when 'Insurance'
      'bi bi-shield-check'
    when 'Withdrawal for Self'
      'bi bi-person-dash'
    when 'Withdrawal for Owner Consumption'
      'bi bi-person-gear'
    else
      'bi bi-receipt'
    end
  end

  def store_name
    if is_main_inventory?
      'Main Inventory'
    elsif store.present?
      store.name
    else
      'Unknown'
    end
  end

  def store_location
    if is_main_inventory?
      'Central Warehouse'
    elsif store.present?
      "#{store.city}, #{store.state}"
    else
      'N/A'
    end
  end

  private

  def store_or_main_inventory_present
    if store.blank? && !is_main_inventory?
      errors.add(:store_id, "must be selected or Main Inventory must be chosen")
    end
  end
end