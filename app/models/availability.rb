class Availability < ApplicationRecord
  belongs_to :user
  has_many :bookings

  def self.available_between(start_date, end_date)
    where("start_date < ? AND end_date > ?", start_date, end_date)
  end

  def start_time
    start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end


