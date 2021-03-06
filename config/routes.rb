Rails.application.routes.draw do

  #pages
  root "pages#welcome"
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'

  #games
  resources :games do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  #users
  resources :users
  get '/signup' => 'users#new', as: :signup
  get '/users/:id/games' => 'users#games', as: :user_games
  patch '/users/:id/photo' => 'users#photo', as: :user_photo

  #sessions
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  #search
  get '/search' => 'search#results'

end
