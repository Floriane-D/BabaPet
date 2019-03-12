class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def search
    search_start_date = params[:search][:start_date]
    search_end_date = params[:search][:end_date]
    availabilities_without_location_criteria = Availability.available_between(search_start_date, search_end_date)

    search_address = params[:search][:address]
    search_distance = params[:search][:distance]
    search_coordinates = Geocoder.search(search_address).first.coordinates

    availabilities_with_location_criteria = []

    availabilities_without_location_criteria.each do |availability|
      if availability.user.distance_to(search_coordinates) < search_distance
        availabilities_with_location_criteria << availability
      end
    end
  end
end
