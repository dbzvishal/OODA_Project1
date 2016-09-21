Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Start page
  root 'login#index'
  get '/login', to: 'login#index', as: 'login'
  # Submit page
  post '/login', to: 'login#show'

  # User Creation page
  get '/users/new', to: 'users#new', as: 'add_user'
  # Submit User Info
  post '/users/create', to: 'users#create', as: 'create_user'

  # Add a room (the form)
  get '/rooms/new', to: 'rooms#new', as: 'add_room'
  # Create a room
  post '/rooms/create', to: 'rooms#create', as: 'create_room'
  # Show room details
  get '/rooms/:id', to: 'rooms#show', as: 'show_room'

  # Logout page
  get '/logout', to: 'login#destroy', as: 'logout'

  get '/users/options', to: 'users#options', as: 'options'
end