class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def new
    # we need @user in our `simple_form_for`
    @user = User.find(params[:user_id])
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.user = User.find(params[:user_id])
    @availability.save
    redirect_to availability_path(@availability.user)
  end

  def show
    @availability = Availability.find(params[:id])
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :price)
  end
end

