class SessionsController < ApplicationController
  before_action :check_sign_in, :except=>[:create]
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to index_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
