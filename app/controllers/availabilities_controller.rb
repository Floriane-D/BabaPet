class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def search
    dates_array = params[:daterange].split(" - ")
    search_start_date = Date.strptime(dates_array[0], '%m/%d/%Y')
    search_end_date = Date.strptime(dates_array[1], '%m/%d/%Y')
    @search_params = { start_date: search_start_date, end_date: search_end_date }

    availabilities_without_location_criteria = Availability.available_between(search_start_date, search_end_date)

    search_address = params[:search][:address]
    search_distance = params[:search][:distance].to_f

    search_coordinates = Geocoder.search(search_address).first.coordinates

    availabilities_with_location_criteria = []

    availabilities_without_location_criteria.each do |availability|
      if availability.user.distance_to(search_coordinates) < search_distance
        availabilities_with_location_criteria << availability
      end
    end

    @availabilities = availabilities_with_location_criteria
    @markers = @availabilities.map do |availability|
      {
        lng: availability.user.longitude,
        lat: availability.user.latitude,
        infoWindow: render_to_string(partial: "availability-card", locals: { availability: availability })
      }
    end
  end

  def index
    @availabilities = Availability.with_location
    @markers = @availabilities.map do |availability|
      {
        lng: availability.user.longitude,
        lat: availability.user.latitude,
        infoWindow: render_to_string(partial: "availability-card", locals: { availability: availability })
      }
    end
  end

  def new
    @availability = Availability.new
    @availabilities = Availability.all
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.user = current_user
    dates_array = params["daterange"].split(" - ")
    start_date = Date.strptime(dates_array[0], '%m/%d/%Y')
    end_date = Date.strptime(dates_array[1], '%m/%d/%Y')
    @availability.start_date = start_date
    @availability.end_date = end_date
    if @availability.save
      redirect_to profile_path # CHANGE THIS IN THE FUTURE!
    else
      render :new
    end
  end

  def show
    @availability = Availability.find(params[:id])
    @user = @availability.user
    @search_params = params.require(:booking).permit(:start_date, :end_date)
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :price)
  end
end
