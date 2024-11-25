Rails.application.routes.draw do
  devise_for :users
  get 'users/profile'

  resources :users, only: [:new, :create, :edit, :update, :show]

  resources :posts

  # Defines the root path route ("/")
  root "pages#index"
end
