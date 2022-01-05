Rails.application.routes.draw do

  get 'searchs/top'
  get '/search' => 'searchs#search', as: 'search'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  resources :books, only: [:new,:create,:index,:show,:destroy,:edit,:update ] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end


end