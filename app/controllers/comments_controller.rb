class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @user = current_user
    # @post = Post.find_by(params[:user_id])
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

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy!
    redirect_to user_post_path(user_id: @post.author_id, id: @post.id), notice: 'Comment successfully deleted'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
