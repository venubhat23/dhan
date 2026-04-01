class StoreAdmin::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
  skip_load_and_authorize_resource
  before_action :authenticate_user!
  before_action :ensure_store_admin_access
  before_action :set_current_store
  before_action :update_store_access_log
  layout 'store_admin'

  protected

  def ensure_store_admin_access
    unless current_user&.store_admin? || current_user&.super_admin?
      redirect_to root_path, alert: 'Access denied. Store admin privileges required.'
    end
  end

  def set_current_store
    @current_store = current_user.primary_store

    unless @current_store
      redirect_to root_path, alert: 'No store assigned. Please contact administrator.'
    end
  end

  def update_store_access_log
    current_user.update_store_access_log! if current_user&.store_admin?
  end

  # Override Devise's after_sign_in_path to redirect store admins to their dashboard
  def after_sign_in_path_for(resource)
    if resource.store_admin?
      store_admin_root_path
    else
      super
    end
  end

  # Store admin specific helpers
  def current_store_inventory_summary
    @current_store_inventory_summary ||= @current_store.store_inventory_summary
  end

  def store_admin_sidebar_permissions
    return @store_admin_permissions if defined?(@store_admin_permissions)

    @store_admin_permissions = {
      'dashboard' => current_user.can_view_reports?,
      'inventory' => current_user.can_manage_inventory?,
      'bookings' => current_user.can_create_bookings?,
      'customers' => current_user.can_create_bookings?,
      'transfers' => current_user.can_request_transfers?,
      'reports' => current_user.can_view_reports?
    }
  end

  helper_method :current_store_inventory_summary, :store_admin_sidebar_permissions
end