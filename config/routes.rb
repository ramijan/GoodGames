Rails.application.routes.draw do

  #pages
  root "pages#welcome"
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'

  #games
  resources :games do
    resources :reviews, only: [:new, :create]
  end

  #users
  resources :users
  get '/signup' => 'users#new', as: :signup
  get '/users/:id/games' => 'users#games', as: :user_games

  #sessions
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  #search
  get '/search' => 'search#results'

end
