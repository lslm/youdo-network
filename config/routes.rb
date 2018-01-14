Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  
  resources :posts, only: [:index, :new, :create, :destroy]
  resources :search, only: [:index]
  resources :relationships
  resources :users, only: [:show] do
    get :following, :followers
  end
end
