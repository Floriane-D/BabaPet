class Availability < ApplicationRecord
  belongs_to :user
  has_many :bookings

  delegate :latitude, to: :user
  delegate :longitude, to: :user
  delegate :distance_to, to: :user

  def start_time
    start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def self.with_location
    joins(:user).where("users.latitude IS NOT NULL AND users.longitude IS NOT NULL")
  end
end


