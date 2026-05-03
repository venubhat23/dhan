class AddCashfreeOrderIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :cashfree_order_id, :string
    add_index  :bookings, :cashfree_order_id
  end
end
