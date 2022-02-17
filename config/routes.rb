Rails.application.routes.draw do
 
  resources :users

  resources :reservations

  resources :flights
  get '/flights/:id/delete' => 'flights#destroy',as: 'destroy_flight'

  resources :airplanes

  # AXIOS flight search form
  get '/search' => 'flights#search'
   
  # AXIOS airplanes index
  get '/api/airplanes' => 'airplanes#react_index'

  get '/login'    => 'session#new'    #show the login form
  post '/login'   => 'session#create' #form submits here, performs login, redirect
  delete '/login' => 'session#delete' #logout link goes here, perform logout, redirect

end