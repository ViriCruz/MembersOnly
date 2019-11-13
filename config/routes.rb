Rails.application.routes.draw do
 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'static_pages#home'

  get '/cookie_create', to: 'application#cookie_creation'
  delete '/cookie_delete', to: 'application#cookie_deletion'

  
end
