Rails.application.routes.draw do

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/new'
  post 'users/create'

  root 'welcome#index'

end
