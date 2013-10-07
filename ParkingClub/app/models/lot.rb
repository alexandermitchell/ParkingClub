class Lot < ActiveRecord::Base

  belongs_to :owner, class: :user, foreign_key: :owner_id

  geocoded_by :address

  reverse_geocoded_by :latitude, :longitude, :address => :full_address

  after_validation :geocode, :reverse_geocode

  def address
    [address, city, province, country].compact.join(', ')
  end

end
