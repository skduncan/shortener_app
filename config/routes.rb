Rails.application.routes.draw do

  root 'shortener#home'

  get '/newlink', to: 'shortlinks#new'
  
end
