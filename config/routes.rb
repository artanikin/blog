Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :pictures, only: [:create, :destroy]
  resources :tags, only: [:show]
end
