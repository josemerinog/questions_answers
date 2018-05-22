Rails.application.routes.draw do

  

  root to: 'questions#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :questions, except: [:new]

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/mis_preguntas', to: 'questions#mis_preguntas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
