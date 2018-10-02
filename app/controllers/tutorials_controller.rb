class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :edit, :update, :destroy, :make_own_tutorial]
  before_action  :set_available_tags_to_gon
  before_action  :set_tags, only: [:index, :show, :pv, :iine, :month_pv, :month_iine, :all_period_pv, :all_period_iine]
  # impressionist :actions=> [:show] unique指定を無視して走ってしまうのでコメントアウト

  def index
    if params[:tag]
      @tutorials = Tutorial.tagged_with(params[:tag]).order(created_at: :desc)
      @tutorials = @tutorials.page(params[:page])
    elsif params[:search]
      @tutorials = Tutorial.search(params[:search]).order(created_at: :desc)
      @tutorials = @tutorials.page(params[:page])
    else
      @tutorials = Tutorial.includes(:users, :tags, :taggings).order(created_at: :desc) # 新規投稿順
      @tutorials = @tutorials.page(params[:page])
    end
  end

  def show
    impressionist(@tutorial, nil, :unique => [:session_hash])
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.ogp_url, @tutorial.ogp_description = get_ogp(@tutorial.url)
    if @tutorial.save
      redirect_to root_path
    else
      session[:error] = @tutorial.errors.full_messages
      redirect_to new_tutorial_path
    end
  end

  def make_own_tutorial
    redirect_to notification_login_path and return unless user_signed_in?

    if UserTutorial.where('user_id = ? and tutorial_id =?', current_user.id, @tutorial.id).blank?
      current_user.tutorials << @tutorial
    else
      UserTutorial.where('user_id = ? and tutorial_id =?', current_user.id, @tutorial.id).delete_all
    end
    redirect_to request.referer
  end

  def set_available_tags_to_gon
    gon.available_tags = Tutorial.tags_on(:tags).pluck(:name)
  end

  private
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    def set_tags
      @tags = Tutorial.tags_on(:tags)
    end

    def get_ogp(url)
      og = OpenGraph.new(url)
      og_image = og.images[0]
      unless og.images[0].include?('http')
        og_image = 'no-ogp-image.jpg'
      end
      return og_image, og.description
    end

    def tutorial_params
      params.require(:tutorial).permit(:title, :content, :url, :tag_list)
    end

    def set_tutorial_tags_to_gon
      gon.tutorial_tags = @tutorial.tag_list
    end
end
