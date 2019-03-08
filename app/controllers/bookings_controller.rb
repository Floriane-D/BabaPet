class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @user = current_user
    @availabilities = current_user.availabilities
  end

  def new
    @booking = Booking.new
    @availability = Availability.find(params[:availability_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @availability = Availability.find(params[:availability_id])
    @booking.availability = @availability
    @booking.user = current_user
    if @booking.save
      redirect_to availability_bookings_path(@availability)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end
end
