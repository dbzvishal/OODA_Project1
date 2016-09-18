Rails.application.routes.draw do

  resources :buildings
  resources :bookings
  resources :users
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Start page
  root 'login#index'

  # Submit page
  post '/login', to: 'login#show'
end
