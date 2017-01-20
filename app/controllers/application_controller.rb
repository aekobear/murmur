class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :init_flash

  def init_flash
    flash.alert ||= []
    flash.notice ||= []
  end

end
