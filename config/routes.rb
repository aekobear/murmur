Rails.application.routes.draw do

  get 'politrees/index'
  get 'politrees/new'
  post 'politrees/create'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/new'
  post 'users/create'


  get '/home', to: 'home#home'

  root 'home#welcome'


end
