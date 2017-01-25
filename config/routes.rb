Rails.application.routes.draw do

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/new'
  post 'users/create'


  get '/welcome', to: 'home#welcome'

  root 'home#index'


end
