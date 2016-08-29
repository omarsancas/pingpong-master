Rails.application.routes.draw do
  resources :games
  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
  post '/save_game', to: 'games#save_game'

end
