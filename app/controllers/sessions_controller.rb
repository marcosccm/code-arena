class SessionsController < ApplicationController
  def create
    CreateUserSession.new(request.env['omniauth.auth'], self).run
  end

  def session_created(user)
    puts user.inspect
    session[:current_user] = user
    redirect_to root_path
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path
  end
end
