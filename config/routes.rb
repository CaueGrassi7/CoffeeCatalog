# config/routes.rb

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions,
  # otherwise 500. Can be used by load balancers and uptime monitors to verify that
  # the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # Generates RESTful routes for the Coffee resource
  resources :coffees, only: [:index, :new, :create, :edit, :update, :destroy]

  # Custom route for managing the catalog
  get '/manage_catalog', to: 'coffees#manage_catalog', as: 'manage_catalog'
  post '/create_coffee', to: 'coffees#create_coffee', as: 'create_coffee'
end
