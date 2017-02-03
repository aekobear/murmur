Rails.application.routes.draw do

  get 'politrees/index'
  get 'politrees/:id', to: 'politrees#show'
  get 'politrees/new'
  post 'politrees/create'
  get 'politrees/:id/destroy', to: 'politrees#destroy'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/new'
  post 'users/create'


  get '/home', to: 'home#home'

  root 'home#welcome'


end
