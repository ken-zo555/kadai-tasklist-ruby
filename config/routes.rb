Rails.application.routes.draw do
  root to: 'toppages#index'
#  root to: 'tasks#index'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'toppages/index'
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]

  resources :tasks
end
