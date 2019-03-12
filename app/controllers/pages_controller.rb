class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def index
    @user = current_user
    @availabilities = @user.availabilities
    @bookings = Booking.where(user_id: @user.id)
  end
end
