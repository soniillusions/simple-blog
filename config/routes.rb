Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:edit, :update, :show]

  get '/users/:username/profile', to: 'users#profile', as: :user_profile

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # Defines the root path route ("/")
  root "posts#index"
end
