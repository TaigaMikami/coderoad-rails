class TutorialsController < ApplicationController
  # before_action  :set_tutorial_tags_to_gon
  before_action  :set_available_tags_to_gon
  before_action  :set_tags

  def index
    if params[:tag]
      @tutorials = Tutorial.tagged_with(params[:tag])
    else
      @tutorials = Tutorial.all
    end
  end

  def show
    @tutorial = Tutorial.find(params[:id])
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

  def set_available_tags_to_gon
    gon.available_tags = Tutorial.tags_on(:tags).pluck(:name)
  end

  private
    def
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    def set_tags
      @tags = Tutorial.tags_on(:tags)
    end

    def tutorial_params
      params.require(:tutorial).permit(:title, :content, :url, :tag_list)
    end

    def set_tutorial_tags_to_gon
      gon.tutorial_tags = @tutorial.tag_list
    end
end
