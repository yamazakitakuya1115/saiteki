Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments, only: :create
  end
  root to: 'articles#index'
  resources :users, only: [:show, :edit, :update]
end