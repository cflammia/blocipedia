class CollaboratorsController < ApplicationController
  def index
    @users = User.all
  end

  def create
  end

  def destroy
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
