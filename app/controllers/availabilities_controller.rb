class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @availabilities = Availability.all
    @markers = @availabilities.map do |availability|
      {
        lng: availability.user.longitude,
        lat: availability.user.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { availability: availability })
      }
    end
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.user = current_user
    if @availability.save
      redirect_to root_path # CHANGE THIS IN THE FUTURE!
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
