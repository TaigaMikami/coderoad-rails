class TutorialsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
      redirect_to root_path
    else
      session[:error] = @tutorial.errors.full_messages
      redirect_to new_tutorial_path
    end
  end

  def tutorial_params
    params.require(:tutorial).permit(:title, :content, :url)
  end
end
