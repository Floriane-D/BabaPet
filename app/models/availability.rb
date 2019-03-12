class Availability < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  delegate :latitude, to: :user
  delegate :longitude, to: :user
  delegate :distance_to, to: :user

  def self.available_between(start_date, end_date)
    where("start_date < ? AND end_date > ?", start_date, end_date)
  end

  def start_time
    start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def self.with_location
    joins(:user).where("users.latitude IS NOT NULL AND users.longitude IS NOT NULL")
  end
end


