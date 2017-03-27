class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.sender_id = session[:user]['id']
    @message.match_room_id = 

    if @message.save
      flash[:notice] = ['Success']
    else
      flash[:errors] = ['Error']
    end
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end
end
