class HomeController < ApplicationController
  before_action :check_sign_in, :except=>[:show]
  def show
  end

  def dashboard
    @books=current_user.books
  end

  def index
  end
end
