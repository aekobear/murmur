Rails.application.routes.draw do

  get 'users/new'
  post 'users/create'

  get 'welcome/index'

  root 'welcome#index'

end
