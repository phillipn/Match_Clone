class MessagesController < ApplicationController
  before_action :check_if_logged_in

  def create
    @message = Message.new(message_params)
    @message.sender_id = session[:user]['id']
    @message.match_room_id = params[:id]

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
