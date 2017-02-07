class PolitreesController < ApplicationController
  
  before_action :validate_politree, only: [:show, :destroy, :join, :leave]
  before_action :validate_member, only: [:leave]

  def index
    @politrees = Politree.all
  end

  def show
  end

  def new
  end

  def create
    politree = Politree.new(name: params[:name], description: params[:description], owner_id: @user.id)
    unless politree.valid?
      politree.errors.messages.each do |attribute, errors|
        errors.each do |error|
          flash.alert << "#{attribute} #{error}"
        end
      end
      return redirect_to action: :new
    end
    politree.save!
    flash.notice << "created #{politree.name}."
    return redirect_to politree_path politree.id
  end

  def destroy
    unless @politree.owner == @user
      flash.alert << "only the owner of this politree may delete it"
      return redirect_to action: :show, id: @politree.id
    end
    flash.notice << "deleted #{@politree.name}"
    @politree.destroy!
    redirect_to action: :index
  end

  def join
    if @membership.nil?
      @politree.memberships.create!(member_id: @user.id)
    else
      flash.alert << "you are already a member of '#{@politree.name}'"
    end
    flash.notice << "you have joined '#{@politree.name}'"
    redirect_to politree_path(@politree.id)
  end

  def leave
    @membership.destroy!
    flash.notice << "you have left '#{@politree.name}'"
    redirect_to politree_path(@politree.id)
  end

  def validate_politree
    @politree = Politree.find(params[:id])
    if @politree.nil? 
      flash.alert << "that politree does not exist"
      return redirect_to action: :index
    end
    @owner = @politree.owner
    @membership = @politree.memberships.where(member_id: @user.id).first
  end

  def validate_member
    if @membership.nil?
      flash.alert << "you must be a member of this politree to do that"
      return redirect_to politree_path(@politree.id)
    end
    @member = @membership.member
  end

end
