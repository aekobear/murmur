class SessionsController < ApplicationController

  skip_before_action :authenticate, only: [:new, :create]
  before_action :antiauthenticate, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by(username: params[:username].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice << "hello, #{user.username}!"
      redirect_to controller: :home, action: :home
    else
      flash.alert << 'wrong username or password'
      redirect_to action: :new
    end
  end

  def destroy
    reset_session
    flash.notice = ["you are now logged out"]
    redirect_to action: :new
  end

end
