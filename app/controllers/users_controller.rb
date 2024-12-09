class UsersController < ApplicationController
  before_action :require_authentication, only: [:edit]
  before_action :set_user_by_username, only: [:show]
  before_action :set_user!, only: [:edit, :update]

  def show
    @pagy, @posts = pagy @user.posts.order(created_at: :desc)
    @posts = @posts.decorate
  end

  def edit
  end

  def update
    if @user.update user_params
      if params[:user][:avatar].present?
        @user.avatar.attach(params[:user][:avatar])
        @user.resize_avatar
      end

      flash[:success] = 'Profile updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_user_by_username
    @user = User.find_by!(username: params[:username])
  end

  def set_user!
    @user = User.find params[:username]
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :avatar, :avatar_resized)
  end
end
