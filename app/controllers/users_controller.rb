class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @mytutorials = @user.tutorials.all
  end

  def notification_login
  end
end
