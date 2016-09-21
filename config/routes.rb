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
  # User Edit page
  get '/users/edit', to: 'users#edit', as: 'edit_user'
  # Show Edit page
  patch '/users/update', to: 'users#update', as: 'update_user'
  # User Edit page
  get '/users', to: 'users#show', as: 'users'

  # New Booking Page
  get '/bookings/new', to: 'bookings#new', as: 'add_booking'
  # Submit Booking Info
  post '/bookings/create', to: 'bookings#create', as: 'create_booking'
  # Show Booking Page
  get '/bookings/show', to: 'bookings#show', as: 'show_booking'
  # Edit Booking Page
  get '/bookings/edit', to: 'bookings#edit', as: 'edit_booking'

  # Logout page
  get '/logout', to: 'login#destroy', as: 'logout'

  get '/users/options', to: 'users#options', as: 'options'
end