Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  
  resources :posts, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show]
  resources :search, only: [:index]
end
