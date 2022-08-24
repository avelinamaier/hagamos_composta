class UsersController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  def show
  end



  private

  def set_task
    @user = User.find(params[:id])
  end
end
