Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  
  resources :favorites, only: [:new, :create, :destroy, :index, :show, :edit]
  resources :user_transactions, only: [:new, :create, :destroy, :edit, :update, :index, :show]
  devise_for :users


  # get ":username/transactions" => "user_transactions#index", as: :user_transactions
  # get ":username/favorites" => "favorites#index", as: :favorites



  # get ":username" => "users#show", as: :user
  # get ":username/liked" => "users#liked", as: :liked
  # get ":username/feed" => "users#feed", as: :feed
  # get ":username/discover" => "users#discover", as: :discover
  # get ":username/followers" => "users#followers", as: :followers
  # get ":username/following" => "users#following", as: :following
end
