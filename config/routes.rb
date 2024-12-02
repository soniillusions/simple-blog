Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:edit, :update]

  get '/users/:username', to: 'users#profile', as: :user_profile

  resources :posts

  # Defines the root path route ("/")
  root "posts#index"
end
