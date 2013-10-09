class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :lots, through: :memberships
  has_many :memberships

  has_many :owned_lots, :class_name => 'Lot', :foreign_key => 'owner_id'

  validates :first_name, :last_name, :email, :password, presence: true
  validates :owner, :inclusion => { :in => [true, false] }
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

end
