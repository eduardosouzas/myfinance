class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :store_current_location, :unless => :devise_controller?
  layout :layout_by_resource

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
        "devise"
    else
        "application"
    end
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

end
