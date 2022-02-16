Rails.application.routes.draw do
 
    resources :users

    resources :reservations

    resources :flights
    get '/flights/:id/delete' => 'flights#destroy',as: 'destroy_flight'

    resources :airplanes

    # AXIOS flight search form
    get '/search' => 'flights#search'

end