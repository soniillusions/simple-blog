class CommentsController < ApplicationController
  before_action :set_commentable!

  def create
    @comment = @commentable.comments.build comment_params

    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to @commentable
    else
      @comment = @comment.decorate
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def set_commentable!
    klass = [Post].detect {|c| params["#{c.name.underscore}_id"]}
    raise ActiveRecord::RecordNotFound if klass.blank?

    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end