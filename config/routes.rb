Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'quote_requests#new'
  post '/contact', to: 'quote_requests#create'
  resources :quote_requests
end
