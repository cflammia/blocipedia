class CollaboratorsController < ApplicationController
  before_action :set_wiki
  def index
    @users = User.all
  end

  def initialize(user)
    user ||= User.new # guest user

    # if a member, they can manage their own posts
    # (or create new ones)
    if user.role? :collaborator
      can :manage, Wiki, :user_id => user.id
    end
    # Moderators can delete any post
    if user.role? :moderator
      can :destroy, Wiki
    end
    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end
  end

  def create

    @collaborator = @wiki.collaborators.build(user_id: params[:user_id])
    authorize @collaborator

    if @collaborator.save
      flash[:notice] = "Collaborator was saved"
      redirect_to wiki_collaborators_path(@wiki)
    else
      flash[:notice] = "Collaborator was not saved. Please try again."
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    authorize @collaborator

    if @collaborator.destroy
      flash[:notice] = "The collaborator has been deleted"
      redirect_to wiki_collaborators_path
    else
      flash[:notice] = "There was an error deleting the collaborator. Please try again."
      redirect_to wiki_collaborators_path(@wiki)
    end
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
