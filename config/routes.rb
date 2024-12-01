Rails.application.routes.draw do
  devise_for :users

  get '/users/:username', to: 'users#profile', as: :user_profile

  resources :users, only: [:new, :create, :edit, :update, :show]

  resources :posts

  # Defines the root path route ("/")
  root "posts#index"
end
