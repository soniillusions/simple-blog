class PostsController < ApplicationController
  before_action :require_authentication, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post!
  after_action :verify_authorized

  def index
    @pagy, @posts =  pagy Post.all.order(created_at: :desc)
    @posts = @posts.decorate
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
    @post = @post.decorate
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if @post.update post_params
      flash[:success] = "Post updated!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find params[:id]
  end

  def authorize_post!
    authorize(@post || Post)
  end
end