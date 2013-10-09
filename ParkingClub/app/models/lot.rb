class Lot < ActiveRecord::Base

  belongs_to :owner, class_name: "User", :foreign_key => "owner_id"

  has_many :memberships

  has_many :users, through: :memberships

  geocoded_by :lot_address

  reverse_geocoded_by :latitude, :longitude, :lot_address => :full_address

  after_validation :geocode, :reverse_geocode

  def lot_address
    [address, city, province, country].compact.join(', ')
  end

  

end
