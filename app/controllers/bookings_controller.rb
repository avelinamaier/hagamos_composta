class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def pick_up
    @booking = Booking.find(params[:id])
    @booking.status = false
    @booking.save
    redirect_to bookings_path
  end

  def create
    @booking = Booking.new(user_id: current_user.id, status: true)
    @booking.save
    redirect_to user_path(current_user.id), notice: "Your booking was Created Successfully!"
  end
end
