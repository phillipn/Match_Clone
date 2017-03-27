module MatchRoomsHelper
  def chat_room_greeting(sender, receiver)
    if sender.id == session[:user]['id']
      sender = 'you'
    else
      receiver = 'you'
    end

    return "Chat between #{sender} and #{receiver}"
  end
end
