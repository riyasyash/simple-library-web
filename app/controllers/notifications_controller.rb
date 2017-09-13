class NotificationsController < ApplicationController

  before_action :check_sign_in

  def create
    user_id = params[:userId]
    message = request.body
    Book.create(user_id,)
  end

  def list
  end

  def delete
  end

end
