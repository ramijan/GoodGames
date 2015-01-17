Rails.application.routes.draw do

  root 'games#index'

  resources :games

  resources :users
  get '/signup' => 'users#new', as: :signup

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy', as: :logout

  get '/search' => 'search#results'

end
