class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to request.referer, notice: "投稿しました"
    else
      flash[:danger] = "失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to event_blog_path(@blog), notice: "コメントを編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(blog_id: params[:blog_id])
  end
end
