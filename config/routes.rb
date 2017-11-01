Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/work', to: 'static_pages#work'
  get '/pay', to: 'static_pages#pay'
  get '/contact', to: 'quote_requests#new'
  post '/contact', to: 'quote_requests#create'
  resources :quote_requests
end
