Rails.application.routes.draw do
  scope '/api' do
    # Get the login token from knock
    post 'user_token' => 'user_token#create'

    # User routes
    get '/users/current' => 'users#current'

    resources :reservations

    resources :flights
    get '/flights/:id/delete' => 'flights#destroy',as: 'destroy_flight'

    resources :airplanes

    # AXIOS flight search form
    get '/search' => 'flights#search'

    get '/login'    => 'session#new'    #show the login form
    post '/login'   => 'session#create' #form submits here, performs login, redirect
    delete '/login' => 'session#delete' #logout link goes here, perform logout, redirect
  end
end