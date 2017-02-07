Rails.application.routes.draw do

  resources :politrees
  post 'politrees/:id/leave', to: 'politrees#leave'
  post 'politrees/:id/join', to: 'politrees#join'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/new'
  post 'users/create'


  get '/home', to: 'home#home'

  root 'home#welcome'


end
