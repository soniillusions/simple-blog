class PostsController < ApplicationController
  before_action :require_authentication, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post!
  after_action :verify_authorized
  before_action :fetch_tags, only: [:new, :edit]

  def index
    @pagy, @posts =  pagy Post.all_by_tags(params[:tag_ids])
    @posts = @posts.decorate
    @tag = Tag.find_by(id: params[:tag_ids])
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
    params.require(:post).permit(:body, tag_ids: [])
  end

  def set_post
    @post = Post.find params[:id]
  end

  def authorize_post!
    authorize(@post || Post)
  end

  def fetch_tags
    @tags = Tag.all
  end
end