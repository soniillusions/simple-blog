Rails.application.routes.draw do
  devise_for :users, skip: :registrations, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/:username/edit', to: 'users/registrations#edit', as: :edit_user_registration
    put 'users/:username', to: 'users/registrations#update', as: :user_registration
    patch 'users/:username', to: 'users/registrations#update'
  end

  resources :users, only: %i[edit update show], param: :username do
    member do
      delete :delete_avatar
      patch :update_avatar
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
