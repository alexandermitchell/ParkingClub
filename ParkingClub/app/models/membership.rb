class Membership < ActiveRecord::Base
  belongs_to :lot
  belongs_to :user

  validates :start_time, :end_time, presence: true

  def days_remaining
    self.end_time - Time.now
  end

end
