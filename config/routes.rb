Rails.application.routes.draw do

  

  root to: 'questions#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
