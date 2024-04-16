Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  resources :favorites, only: [:create, :destroy, :index]
  resources :user_transactions
  devise_for :users


  get ":username/transactions" => "user_transactions#index", as: :current_user_transactions
  get ":username/transaction/new" => "user_transactions#new", as: :new_transaction
  get ":username/transaction/:id/edit" => "user_transactions#edit", as: :edit_transaction
  get ":username/transaction/:id" => "user_transactions#show", as: :current_transaction


  get ":username/favorites" => "favorites#index", as: :current_user_favorites


end
