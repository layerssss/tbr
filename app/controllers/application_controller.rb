class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticated_admin!
  protected
  def authenticated_admin!
    redirect_to '/auth/facebook' unless session['auth'].present?
  end
end
