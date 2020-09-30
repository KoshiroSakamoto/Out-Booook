Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tweets#home'
  patch 'tweets' => 'tweets#update'
  

  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    
  end

  

  
  
  

  # root 'hello#index'
  # get 'tweets/new' => 'tweets#new'
  # get 'tweets' => 'tweets#index'
  # post 'tweets' => 'tweets#create'
  # get 'tweets/:id' => 'tweets#show',as: 'tweet'
  # patch 'tweets/:id' => 'tweets#update'
  # delete 'tweets/:id' => 'tweets#destroy'
  # get 'tweets/:id/edit' => 'tweets#edit', as:'edit_tweet'
  
end
