class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(user_id: current_user.id, subscription_id: params[:subscription_id], status: true)
    @booking.save
    redirect_to user_path(current_user.id)
  end
end
