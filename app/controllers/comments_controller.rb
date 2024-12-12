class CommentsController < ApplicationController
  before_action :require_authentication, except: [:show, :index]
  before_action :set_commentable!
  before_action :set_post
  after_action :verify_authorized

  def index
  end

  def show
  end

  def create
    @comment = @commentable.comments.build comment_params

    authorize @comment

    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to @commentable
    else
      @post = @commentable.decorate
      @comment = @comment.decorate
      render 'posts/show'
    end
  end

  def destroy
    comment = @commentable.comments.find params[:id]
    authorize comment

    comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def set_post
    @post = @commentable.is_a?(Post) ? @commentable : @commentable.post
  end

  def set_commentable!
    klass = [Post].detect {|c| params["#{c.name.underscore}_id"]}
    raise ActiveRecord::RecordNotFound if klass.blank?

    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end