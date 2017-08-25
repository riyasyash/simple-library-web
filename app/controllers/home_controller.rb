class HomeController < ApplicationController
  before_action :check_sign_in, :except=>[:show]
  def show
  end

  def dashboard
  end

  def index
  end
end
