class CollaboratorPolicy < ApplicationPolicy

  def index?
    true
  end

  def new
    @wiki = Wiki.new
      authorize @wiki
  end
