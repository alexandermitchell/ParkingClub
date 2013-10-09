class Membership < ActiveRecord::Base
  belongs_to :lot
  belongs_to :users

end
