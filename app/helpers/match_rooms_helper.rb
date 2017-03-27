module MatchRoomsHelper
  def chat_room_greeting(sender, receiver)
    if sender.id == 1
      sender.first_name = 'you'
    else
      receiver.first_name = 'you'
    end

    return "Chat between #{sender.first_name} and #{receiver.first_name}"
  end
end
