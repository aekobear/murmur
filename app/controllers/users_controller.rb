class UsersController < ApplicationController

  skip_before_filter :authenticate, only: [:new, :create]
  before_filter :antiauthenticate, only: [:new, :create]

  def new
  end

  def create
    user = User.create(params.permit(:username, :phone, :email, :email_confirmation, :password, :password_confirmation))
    unless user.valid?
      user.errors.messages.each do |attribute, errors|
        errors.each do |error|
          flash.alert << "#{attribute} #{error}"
        end
      end
      return redirect_to action: :new
    end
    flash.notice << "welcome, #{user.username}."
    return redirect_to controller: :welcome, action: :home
  end

  def show
  end

end
