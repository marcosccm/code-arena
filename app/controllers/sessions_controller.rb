class SessionsController < ApplicationController
  def create
    puts request.env['omniauth.auth']
    session[:auth_hash] = request.env['omniauth.auth']
    redirect_to root_path
  end
end
