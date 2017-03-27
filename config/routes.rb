Rails.application.routes.draw do
  get 'match_rooms/' => 'match_rooms#index', as: "match_room_index"
  get 'match_rooms/:id/' => 'match_rooms#show', as: "show_match_room"
  post 'match_rooms/' => 'match_rooms#create', as: "create_match_room"
  put 'match_rooms/:id/' => 'match_rooms#update', as: "match_room"
  post 'match_rooms/:id/messages/'  => 'messages#create', as: "create_message"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
