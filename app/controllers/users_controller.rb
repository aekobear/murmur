class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(params.permit(:username, :email, :email_confirmation, :password, :password_confirmation))
    unless user.valid?
      flash.alert = []
      user.errors.messages.each do |attribute, errors|
        errors.each do |error|
          flash.alert << "#{attribute} #{error}"
        end
      end
      return redirect_to action: :new
    end
    flash.notice << "welcome, #{user.username}."
    return redirect_to controller: :welcome, action: :index
  end

  def show
  end

end
