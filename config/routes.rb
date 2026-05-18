Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root "home#index"
  resources :tasks
  get "signup", to: "users#new"
  get "users", to: "users#index"
  resources :users, except: [ :new ]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
