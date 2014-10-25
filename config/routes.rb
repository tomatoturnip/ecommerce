Rails.application.routes.draw do

  resources :products
  resources :users

  root to: "welcome#index"

  # oauth routes
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure'            => redirect('/')

  # Login logout vanity routes
  get '/login'    => 'sessions#new', as: :login
  get '/logout'   => 'sessions#destroy', as: :logout
  get '/register' => 'users#new', as: :register

end
