Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :favorites, only: [:new, :create, :destroy, :index, ]
  resources :user_transactions, only: [:new, :create, :destroy, :edit, :update, :index, :show]
  devise_for :users



  root "home#index"
end
