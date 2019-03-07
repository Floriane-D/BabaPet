class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @availabilities = current_user.availabilities
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
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :price)
  end
end

