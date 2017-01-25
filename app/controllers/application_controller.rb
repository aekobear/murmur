class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :init_flash

  before_action :authenticate

  def init_flash
    flash.alert = [] if flash.alert.nil? || flash.alert.empty?
    flash.notice = [] if flash.notice.nil? || flash.notice.empty?
  end

  def authenticate
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      flash.alert << 'you must be logged in to view that page!'
      redirect_to controller: :sessions, action: :new
    end
  end

  def antiauthenticate
    @user = User.find_by(id: session[:user_id])
    unless @user.nil?
      redirect_to '/'
    end
  end

end
