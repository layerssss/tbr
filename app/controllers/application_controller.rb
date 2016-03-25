class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def authenticated_user!
    redirect_to '/auth/facebook' unless session['auth'].present?
  end
  def authenticated_admin!
    redirect_to root_path, alert: 'You are not an administrator of the Facebook page yet.' unless session['is_admin'].present?
  end
end
