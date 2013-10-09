class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :lots, through: :memberships
  has_and_belongs_to_many :memberships

  validates :first_name, :last_name, :email, :password, :owner, :password_confirmation, presence: true

end
