Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: %i[edit update show], param: :username do
    member do
      delete :delete_avatar
    end
  end

  resource :password_reset, only: %i[new create edit update]

  resources :posts do
    resources :comments, only: %i[create destroy]
  end

  namespace :api do
    resources :tags, only: :index
  end

  # Defines the root path route ("/")
  root 'posts#index'
end
