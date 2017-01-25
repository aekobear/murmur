Rails.application.routes.draw do

  get 'sessions/new'
  post 'sessions/create'

  get 'users/new'
  post 'users/create'

  root 'welcome#index'

end
