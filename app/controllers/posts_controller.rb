class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    # @user = User.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy!
    redirect_to user_posts_path(@post.author_id), notice: 'Post successfully deleted'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
