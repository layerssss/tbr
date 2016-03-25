Rails.application.routes.draw do
  root 'photos#index'
  resources :countries
  resources :continents
  resources :stays
  resources :photos
  resources :notes
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
