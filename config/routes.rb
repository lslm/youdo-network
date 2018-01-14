Rails.application.routes.draw do
  root 'feed#index'
  devise_for :users
  
  resources :feed, only: [:index]
  resources :posts, only: [:index, :new, :create, :destroy]
  resources :relationships
  resources :search, only: [:index]
  resources :users, only: [:show] do
    get :following, :followers
  end
end
