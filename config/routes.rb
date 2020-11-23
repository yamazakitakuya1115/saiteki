Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  root to: 'articles#index'

  resources :users, only: [:show, :edit, :update] do
    get 'mine' => 'users#mine'
    resources :tweets, only: [:new, :create, :edit, :update]
  end

  get 'grade' => 'articles#grade'
  get 'subject' => 'articles#subject'
  get 'genre' => 'articles#genre'

  resources :favorites, only: [:index, :create, :destroy]

end