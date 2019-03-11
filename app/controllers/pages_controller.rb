class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def profile
    @availabilities = current_user.availabilities
  end

  def index

  end


end
