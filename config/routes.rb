Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:show] do
    resource :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index]
  patch "users/:id", to: "users#subscribe", as: :add_user_subscription
  patch "bookings/:id", to: "bookings#pick_up", as: :pick_up
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :subscriptions, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
end
