class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :init_flash

  def init_flash
    flash.alert = [] if flash.alert.nil? || flash.alert.empty?
    flash.notice = [] if flash.notice.nil? || flash.notice.empty?
  end

end
