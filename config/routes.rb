Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments, only: :create
  end

  root to: 'articles#index'

  resources :users, only: [:show, :edit, :update] do
    get 'mine' => 'users#mine'
    resources :tweets, only: [:new, :create, :edit, :update]
  end

end