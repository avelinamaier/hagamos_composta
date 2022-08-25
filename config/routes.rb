Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:show] do
    resource :booking, only: [:new, :create]
  end
  patch "users/:id", to: "users#subscribe", as: :add_user_subscription
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :subscriptions, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
end
