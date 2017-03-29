class MessagesController < ApplicationController
  before_action :check_if_logged_in

  def create
    @match_room = MatchRoom.find(params[:id])
    @message = Message.new(message_params)
    @message.sender_id = session[:user]['id']
    @message.match_room_id = params[:id]

    if @message.save
      ActionCable.server.broadcast 'messages',
        content: @message.content,
        created_at: @message.created_at,
        room_id: @match_room.id,
        sender: @message.sender.first_name,
        receiver: @match_room.receiver,
        user_id: session[:user]['id'],
        sender_id: @message.sender.id
      head :ok
    end
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end
end
