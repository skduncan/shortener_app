Rails.application.routes.draw do

  root 'shortlinks#index'

  get '/newlink', to: 'shortlinks#new'
  post '/newlink', to: 'shortlinks#create'
  
  resources :shortlinks
  
end
