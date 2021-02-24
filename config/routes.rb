Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users

  #THESE FORMS ARE FOR LOGGING IN/OUT
  #renders a form in the browser
  get '/login' => 'sessions#new'
  #receives the form rendered above
  #creates a new session with above info and user data
  post '/login' => 'sessions#create'
  #ends the session 
  get 'logout' => 'sessions#destroy'
  #THESE FORMS ARE FOR SIGNING UP
  #renders a form in the browser
  get '/signup' => 'users#new'
  #receives the form rendered above
  #creates a new user in the database using the data given by user
  post '/users' => 'users#create'

  resources :accounts do
    resources :transactions
    resources :payments
  end
end
