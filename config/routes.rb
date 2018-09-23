Rails.application.routes.draw do

  root 'shortlinks#index'
  
  post '/text', to: 'shortlinks#message'
  get '/text', to: 'shortlinks#text'

  get '/newlink', to: 'shortlinks#new'
  post '/newlink', to: 'shortlinks#create'
  
  get '/:shortlink', to: 'shortlinks#redirect'

  
  resources :shortlinks
end
