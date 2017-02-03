class PolitreesController < ApplicationController
  
  def index
    @politrees = Politree.all
  end

  def create
    politree = Politree.create(name: params[:name], description: params[:description], user_id: @user.id)
    unless politree.valid?
      politree.errors.messages.each do |attribute, errors|
        errors.each do |error|
          flash.alert << "#{attribute} #{error}"
        end
      end
      return redirect_to action: :new
    end
    flash.notice << "created #{politree.name}."
    return redirect_to action: :index

  end

end
