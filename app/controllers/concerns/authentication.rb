module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def user_signed_in?
      current_user.present?
    end

    def require_authentication
      return if user_signed_in?

      flash[:warning] = 'You need to sign in or sign up before continuing.'
      redirect_to root_path
    end
  end
end