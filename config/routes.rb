Rails.application.routes.draw do
  get 'match_rooms/show'

  post 'match_rooms/'

  post 'messages/'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
