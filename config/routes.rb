Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:index, :new, :create, :show]
  root to: 'articles#index'
end