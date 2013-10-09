class Membership < ActiveRecord::Base
  belongs_to :lot
  has_and_belongs_to_many :users

end
