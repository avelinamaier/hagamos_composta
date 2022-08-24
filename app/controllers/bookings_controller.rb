class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(user_id: current_user.id, subscription_id: params[:subscription_id])
    @booking.save
    redirect_to user_path(current_user.id)
  end


end
