Rails.application.routes.draw do
  root 'users#index'
  get '/users/new' => 'users#new', as: "users_new"
  post'/users' => 'users#create', as: "users_create"
  post '/login' => 'users#login', as: "users_login"
  post '/logout' => 'users#logout', as: "users_logout"
  get '/users/:id' => 'users#show', as: "users_show"
  get '/survey/personality' => 'users#personality_survey', as: "users_personality_survey"
  post '/survey/personality' => 'users#post_personality_survey', as: "users_post_personality_survey"
  get '/survey/personal' => 'users#personal_survey'
  post '/survey/personal' => 'users#post_personal_survey'
  get '/users/:id/edit/profile' => 'users#edit', as: "users_edit"
  patch '/users/:id/update' => 'users#update'


  get 'match_rooms/' => 'match_rooms#index', as: "match_room_index"
  get 'match_rooms/:id/' => 'match_rooms#show', as: "show_match_room"
  post 'match_rooms/' => 'match_rooms#create', as: "match_rooms"
  put 'match_rooms/:id/' => 'match_rooms#update', as: "match_room"
  post 'match_rooms/:id/messages/'  => 'messages#create', as: "match_room_messages"

  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
