Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :words
  get 'game/new', to: 'game#new_game'
  post 'game/guess', to: 'game#guess'
  root 'game#new_game'
end
