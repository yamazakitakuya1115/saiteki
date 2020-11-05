Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:index, :new, :create, :show, :edit, :update]
  root to: 'articles#index'
  resources :users, only: [:show, :edit, :update]
end