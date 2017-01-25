class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username].downcase)
    if user && user.authenticate(params[:password])
      flash.notice << "hello #{user.username}"
      redirect_to '/'
    else
      flash.alert << 'wrong username or password'
      redirect_to action: :new
    end
  end

end
