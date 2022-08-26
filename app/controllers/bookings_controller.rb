class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(user_id: current_user.id, status: true)
    @booking.save
    redirect_to user_path(current_user.id), notice: "Your booking was Created Successfully!"
  end
end
