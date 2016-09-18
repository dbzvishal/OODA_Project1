Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Start page
  root 'login#index'
  get '/login', to: 'login#index', as: 'login'
  # Submit page
  post '/login', to: 'login#show'
  # Logout page
  get '/logout', to: 'login#destroy', as: 'logout'

  get '/users/options', to: 'users#options', as: 'options'
end
