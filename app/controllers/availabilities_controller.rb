class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @availabilities = Availability.all
  end

  def new
    @availability = Availability.new
    @availabilities = Availability.all
    @availability_array = [:start_date.. :end_date]
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
