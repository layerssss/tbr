Rails.application.routes.draw do
  root 'countries#index'
  get '/auth/:provider/callback', to: 'sessions#create'
end
