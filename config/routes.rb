Rails.application.routes.draw do

  root 'shortener#home'

  get '/newlink', to: 'shortlinks#new'
  post '/newlink', to: 'shortlinks#create'
  
  resources :shortlinks
  
end
