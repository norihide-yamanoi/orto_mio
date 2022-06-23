class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]
  def index
    if params[:select_event]
      @select_event = Event.find(params[:event_id])
      @blogs = @select_event.blogs.order(created_at: :desc)
      @name = @select_event.name
    else
      @blogs = Blog.all
    end
  end

  def index_all
    @q = Blog.ransack(params[:q])
    @blogs = @q.result.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to event_blogs_path(select_event: :true), notice: "ブログを投稿しました‼︎"
      else
        render :new
      end
    end
  end

  def show
    @comment = Comment.new
    @comments = @blog.comments.includes(:user)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to event_blogs_path(select_event: :true), notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to event_blogs_path(select_event: :true), notice:"ブログを削除しました！"
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def search
    @results = @q.result
  end

  private

  def  blog_params
    params.require(:blog).permit(:title, :content, :photo, :photo_cache).merge(event_id: params[:event_id])
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_q
    @q = Blog.ransack(params[:q])
  end
end
