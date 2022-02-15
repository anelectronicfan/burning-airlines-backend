Rails.application.routes.draw do
 
resources :users

resources :reservations

resources :flights
get '/flights/id/edit' => 'flights#edit', as: 'edit_project'

resources :airplanes

end