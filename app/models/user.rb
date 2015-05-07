class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy
  has_many :collaborators

  def admin?
    role = 'admin'
  end

  def collaborator?
    role = 'collaborator'
  end

  def moderator?
    role = 'moderator'
  end

  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def account?(base_account)
    account_type == base_account.to_s
  end

  def set_member
    self.role = 'collaborator'
  end
end
