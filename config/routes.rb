Rails.application.routes.draw do
  root "home#index"
  resources :tasks
  get "signup", to: "users#new"
  get "users", to: "users#index"
  resources :users, except: [ :new ]
end
