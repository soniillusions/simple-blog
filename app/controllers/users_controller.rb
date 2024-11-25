class UsersController < ApplicationController
  before_action :set_user!, only: %i[edit update]

  def profile
  end

  def edit
  end

  def update
    if @user.update user_params
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
    params.require(:user).permit(:email, :password)
  end
end
