Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :subscriptions, only: [:index] do
    resources :bookings, only: [:new, :create]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
