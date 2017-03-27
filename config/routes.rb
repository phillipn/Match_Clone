Rails.application.routes.draw do
  root 'users#index'
  get '/users/new' => 'users#new'
  post'/users' => 'users#create'
  post '/login' => 'users#login'
  post '/logout' => 'users#logout'
  get '/users/:id' => 'users#show'

  get 'match_rooms/:id/' => 'match_rooms#show', as: "show_match_room"
  post 'match_rooms/' => 'match_rooms#create', as: "create_match_room"
  post 'match_rooms/:id/messages/'  => 'messages#create', as: "create_message"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
