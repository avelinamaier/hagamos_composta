class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def set_user
    @user = current_user
  end
end
