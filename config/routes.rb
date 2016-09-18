Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Start page
  root 'login#index'

  # Submit page
  post '/login', to: 'login#show'

  get '/users/options', to: 'users#options', as: 'options'
end
