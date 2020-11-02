Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: :index
  root to: 'articles#index'
end