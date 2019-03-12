class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new(booking_params)
    @availability = Availability.find(params[:availability_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @availability = Availability.find(params[:availability_id])
    @booking.availability = @availability
    @booking.price = @availability.price
    @booking.user = current_user
    if @booking.save
      redirect_to profile_path
      # flash[:notice] = "Congratulations! 🎉 Your booking with #{@booking.availability.user.name} has been completed"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end
end



