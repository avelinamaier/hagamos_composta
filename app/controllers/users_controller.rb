class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :subscribe]
  def show
    @bookings = current_user.bookings
  end

  def subscribe
    @user.subscription_id = params[:id]
    if @user.save
      redirect_to subscriptions_path notice: "Now you have a subscription!"
    end
  end

  private

  def set_user
    @user = current_user
  end
end
