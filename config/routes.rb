Rails.application.routes.draw do
 
resources :users

resources :reservations

resources :flights
# get '/flights/new'       => 'flights#new', as: 'new_flight'
# post '/flights'         => 'flights#create'
# get '/flights'           => 'flights#index', 
# get '/flights/:id'       => 'flights#show', as: 'flight'
# get '/flights/id/edit'   => 'flights#edit', as: 'edit_flight'

resources :airplanes

# AXIOS flight search form
get '/search' => 'flights#search'

end