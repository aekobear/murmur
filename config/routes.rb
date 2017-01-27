Rails.application.routes.draw do

  get 'politrees/index'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/new'
  post 'users/create'


  get '/home', to: 'home#home'

  root 'home#welcome'


end
