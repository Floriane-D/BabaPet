class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @user = current_user
    @availability = Availability.find(params[:availability_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @availability = Availability.find(params[:availability_id])
    @booking.availability = @availability
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to root_path #CHANGE THIS IN THE FUTURE!
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end
end
