class SessionsController < ApplicationController
  def create
    session[:auth_hash] = request.env['omniauth.auth']
    redirect_to root_path
  end

  def destroy
    session[:auth_hash] = nil
    redirect_to root_path
  end
end
