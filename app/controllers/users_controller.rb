class UsersController < ApplicationController
  before_action :require_authentication, only: [:edit]
  before_action :set_user_by_username, only: %i[show update_avatar delete_avatar]
  before_action :set_user!, only: %i[edit]

  def show
    @pagy, @posts = pagy @user.posts.order(created_at: :desc)
    @posts = @posts.decorate
  end

  def edit; end

  def update_avatar
    if params[:user].blank? || params[:user][:avatar].blank?
      flash.now[:error] = 'No image present.'
    elsif @user.update user_params
      respond_to do |format|
        format.html do
          @user.avatar.attach(params[:user][:avatar])
          @user.resize_avatar
          flash[:success] = 'Avatar updated!'
          redirect_to edit_user_registration_path(current_user.username)
        end

        format.turbo_stream do
          @user.avatar.attach(params[:user][:avatar])
          @user.resize_avatar
          flash.now[:success] = 'Avatar was successfully updated!'
          render :update
        end
      end
    else
      flash.now[:error] = 'Failed to update user.'
    end
  end

  def delete_avatar
    @user.avatar.purge
    @user.avatar_resized.purge
    redirect_to edit_user_registration_path(current_user.username)
    flash[:success] = 'Avatar was successfully deleted!'
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
