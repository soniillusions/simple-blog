# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_authentication, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_post!
  after_action :verify_authorized
  before_action :fetch_tags, only: %i[new edit]

  def index
    @pagy, @posts = pagy Post.all_by_tags(params[:tag_ids])
    @posts = @posts.decorate
    @tag = Tag.find_by(id: params[:tag_ids])
  end

  def new
    @post = Post.new
  end

  def edit; end

  def show
    @post = Post.find(params[:id])
    @post = @post.decorate
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      respond_to do |format|
        format.html do
          flash[:success] = 'Post created!'
          redirect_to posts_path
        end

        format.turbo_stream do
          @post = @post.decorate
          flash.now[:success] = 'Post created!'
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update post_params
      respond_to do |format|
        format.html do
          flash[:success] = 'Post updated!'
          redirect_to posts_path
        end

        format.turbo_stream do
          @post = @post.decorate
          flash.now[:success] = 'Post updated!'
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Post deleted!'
        redirect_to posts_path
      end

      format.turbo_stream do
        flash[:success] = 'Post deleted!'
      end
    end
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
