class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :done, :doing]

  def index
    @users = User.all
  end

  def show
    @mytutorials = @user.tutorials.includes(:taggings, :users)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def notification_login
  end

  def change_task_status
    status = current_user.user_tutorials.find_by(tutorial_id: params[:tutorial_id]).is_done
    if status == 0
      current_user.user_tutorials.find_by(tutorial_id: params[:tutorial_id]).update(is_done: 1)
    else
      current_user.user_tutorials.find_by(tutorial_id: params[:tutorial_id]).update(is_done: 0)
    end
    redirect_to request.referer
  end

  def done
    @mytutorials = current_user.tutorials.includes(:user_tutorials, :taggings, :users).where(user_tutorials: {is_done: 1})
  end

  def doing
    @mytutorials = current_user.tutorials.includes(:user_tutorials, :taggings, :users).where(user_tutorials: {is_done: 0})
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description)
  end
end
