class StoreAdmin::DashboardController < StoreAdmin::ApplicationController
  def index
    @inventory_summary = @current_store.store_inventory_summary
    @low_stock_products = @current_store.low_stock_products(10).first(5)
    @recent_bookings = @current_store.bookings.recent.limit(5).includes(:customer, :booking_items)
    @pending_incoming_transfers = @current_store.incoming_transfers.pending.limit(5).includes(:product, :from_store, :initiated_by)
    @recent_stock_movements = @current_store.stock_movements.recent.limit(10).includes(:product)

    # Analytics data for charts/graphs
    @daily_sales = calculate_daily_sales_trend
    @product_performance = calculate_top_performing_products
    @inventory_alerts = calculate_inventory_alerts
  end

  private

  def calculate_daily_sales_trend
    # Get sales data for last 7 days
    start_date = 7.days.ago.to_date
    end_date = Date.current

    (start_date..end_date).map do |date|
      {
        date: date.strftime('%m/%d'),
        sales: @current_store.daily_sales_summary(date),
        bookings_count: @current_store.bookings.where(
          created_at: date.beginning_of_day..date.end_of_day
        ).where.not(status: ['cancelled', 'returned']).count
      }
    end
  end

  def calculate_top_performing_products
    # Top 5 products by sales in last 30 days
    @current_store.bookings
                  .joins(:booking_items)
                  .where(created_at: 30.days.ago..Time.current)
                  .where.not(status: ['cancelled', 'returned'])
                  .group('booking_items.product_id')
                  .joins('INNER JOIN products ON products.id = booking_items.product_id')
                  .select('products.name, SUM(booking_items.quantity) as total_sold, SUM(booking_items.total) as total_revenue')
                  .order('total_revenue DESC')
                  .limit(5)
  end

  def calculate_inventory_alerts
    {
      low_stock_count: @current_store.low_stock_products.count,
      out_of_stock_count: @current_store.store_products_with_inventory.select { |p| @current_store.available_inventory(p.id) == 0 }.count,
      pending_transfers: @current_store.incoming_transfers.pending.count + @current_store.outgoing_transfers.pending.count,
      total_products: @current_store.store_products_with_inventory.count
    }
  end
end