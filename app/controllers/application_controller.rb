class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_sign_in
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def user_signed_in?
    return true if current_user
  end

end
