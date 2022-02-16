Rails.application.routes.draw do
 
resources :users

resources :reservations

resources :flights
get '/flights' => 'flights#index'

resources :airplanes

end