class Lot < ActiveRecord::Base

  belongs_to :owner, class_name: "User", :foreign_key => "owner_id"

  has_many :memberships

  has_many :users, through: :memberships

  geocoded_by :lot_address

  acts_as_gmappable

  reverse_geocoded_by :latitude, :longitude, :lot_address => :full_address
  validates :name, :address, :city, :province, :country, :daily_rate_in_cents, presence: true

  after_validation :geocode, :reverse_geocode

  def lot_address
    [address, city, province, country].compact.join(', ')
  end

  def search_address
    [address, city, province, country].compact.join(', ')
  end

  def self.search(search)
    if search
      @lots = Lot.near(search, 5, :units => :km)
    else
      @lots = Lot.all
    end
  end

end
