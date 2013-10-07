class User < ActiveRecord::Base
  authenticates_with_sorcery!


  validates :first_name, :last_name, :email, :password, presence: true

  
end
