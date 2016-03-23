class SessionsController < ApplicationController
  skip_before_action :authenticated_admin!
  def create
    session['auth'] = request.env['omniauth.auth']
    redirect_to '/'
  end
end
