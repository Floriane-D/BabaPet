class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :price)
  end
end
