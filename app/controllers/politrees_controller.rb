class PolitreesController < ApplicationController
  
  def index
    @politrees = Politree.all
  end

  def show
    @politree = Politree.find(params[:id])
    if @politree.nil?
      flash.alert << "that politree does not exist"
      return redirect_to action: :index
    end
    @owner = User.find(@politree.user_id)
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

  def destroy
    politree = Politree.find(params[:id])
    if politree.nil?
      flash.alert << "that politree does not exist"
      return redirect_to action: :show, id: politree.id
    end
    owner = User.find(politree.user_id)
    unless owner == @user
      flash.alert << "only the owner of this politree may delete it"
      return redirect_to action: :show, id: politree.id
    end
    flash.notice << "deleted #{politree.name}"
    politree.destroy!
    redirect_to action: :index
  end
end
