class Availability < ApplicationRecord
  belongs_to :user
  has_many :bookings

  def start_time
    start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end


