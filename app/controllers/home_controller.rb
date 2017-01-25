class HomeController < ApplicationController

  skip_before_action :authenticate, only: [ :welcome ]
  before_action :antiauthenticate, only: [ :welcome ]

  def index
  end

  def welcome
  end

end
