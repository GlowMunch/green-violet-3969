Rails.application.routes.draw do
  
  resources :airlines, only: [:show]
  resources :flights, only: [:index]
  resources :flights_passengers, only: [:destroy]

end
