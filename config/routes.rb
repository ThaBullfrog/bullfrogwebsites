Rails.application.routes.draw do
  root 'static_pages#home'
  get '/work', to: 'static_pages#work'
  get '/contact', to: 'quote_requests#new'
  post '/contact', to: 'quote_requests#create'
  resources :quote_requests
end
