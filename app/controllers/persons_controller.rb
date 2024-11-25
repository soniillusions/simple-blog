class PersonsController < ApplicationController
  before_action :set_user!, only: %i[edit update]

  def profile
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = 'Profile updated'
      redirect_to persons_profile_path
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
