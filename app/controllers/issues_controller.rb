class IssuesController < ApplicationController

  before_action :validate_politree, only: [:new, :create]
  before_action :validate_member, only: [:new, :create]

  def show
  end

  def new
  end

  def create
    issue = @politree.issues.new(topic: params[:topic], description: params[:description], user_id: @user.id)
    unless issue.valid?
      issue.errors.messages.each do |attribute, errors|
        errors.each do |error|
          flash.alert << "#{attribute} #{error}"
        end
      end
      return redirect_to action: :new
    end
    issue.save!
    flash.notice << "created issue: \"#{issue.topic}.\""
    return redirect_to politree_issue_path @politree.id, issue.id
  end

  def validate_politree
    @politree = Politree.find(params[:politree_id])
    if @politree.nil? 
      flash.alert << "that politree does not exist"
      return redirect_to controller: :politrees, action: :index
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
