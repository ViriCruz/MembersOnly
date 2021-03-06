Rails.application.routes.draw do
 
  resources :users, only: [:new, :create]

  resources :posts, only: [:new ,:create, :index]  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#delete'
  
  root 'posts#index'
end
