class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts.order.(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
      @posts = @posts.decorate
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = "Post created!"
      redirect_to
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find params[:id]
  end
end