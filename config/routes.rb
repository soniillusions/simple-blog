Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:edit, :update, :show], param: :username

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  namespace :api do
    resources :tags, only: :index
  end

  # Defines the root path route ("/")
  root "posts#index"
end
