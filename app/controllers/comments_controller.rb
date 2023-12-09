class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:user_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @post = Post.find_by(id: params[:post_id])
    @comment.post = @post
    if @comment.save
      @post.save
      redirect_to user_post_path(@comment.user, @post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
