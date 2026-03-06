class Franchise::DashboardController < Franchise::BaseController
  def index
    # Redirect franchise users directly to bookings page
    redirect_to franchise_bookings_path
  end
end