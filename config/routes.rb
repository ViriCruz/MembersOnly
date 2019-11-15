Rails.application.routes.draw do
 
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  resources :users, only: [:show]

  resources :posts, only: [:new ,:create, :index]  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  root 'static_pages#home'
end
