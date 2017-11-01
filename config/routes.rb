Rails.application.routes.draw do
  devise_for :users, controllers: { registration: :registrations }
  root 'static_pages#home'
  get '/work', to: 'static_pages#work'
  get '/pay', to: 'pay#index'
  post '/pay', to: 'pay#create'
  get '/contact', to: 'quote_requests#new'
  post '/contact', to: 'quote_requests#create'
  resources :quote_requests
end
