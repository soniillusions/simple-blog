class UsersController < ApplicationController
  before_action :require_authentication, only: [:profile]
  before_action :set_user!, only: %i[edit update]

  def profile
    @user = current_user
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
      redirect_to users_profile_path
    else
      render :edit
    end
  end

  private
  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :avatar, :avatar_resized)
  end
end
