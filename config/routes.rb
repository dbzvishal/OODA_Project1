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
  # User List page
  get '/users/index', to: 'users#index', as: 'users_index'
  # Admin Edit page
  get '/users/admin_index', to: 'users#admin_index', as: 'users_admin_index'
  # User Destroy page
  get '/users/destroy', to: 'users#destroy', as: 'users_destroy'

  # Add a room (the form)
  get '/rooms/new', to: 'rooms#new', as: 'add_room'
  # Create a room
  post '/rooms/create', to: 'rooms#create', as: 'create_room'
  # Show room details
  get '/rooms/:id', to: 'rooms#show', as: 'show_room'
  # List rooms
  get '/rooms', to: 'rooms#index', as: 'rooms'
  # Destroy rooms
  get '/rooms/destroy', to: 'rooms#destroy', as: 'rooms_destroy'

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