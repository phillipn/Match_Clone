class MatchRoomsController < ApplicationController
  def index
    @matches_sent = MatchRoom.where("sender_id = ?", session[:user]['id'])
    @matches_received = MatchRoom.where("receiver_id = ?", session[:user]['id'])
  end

  def show
    @message = Message.new
    @match_room = MatchRoom.find(params[:id])
  end

  def create
    @match_room = MatchRoom.new()
    @match_room.status = 'Pending'
    @match_room.sender_id = params[:sender_id]
    @match_room.receiver_id = params[:receiver_id]

    if @match_room.save
      flash[:notice] = ['Success']
    else
      flash[:errors] = ['Error']
    end
  end

  def update
    @match_room = MatchRoom.find(params[:id])
    @match_room.status = params["match_room"]["status"]

    if @match_room.save
      flash[:notice] = ['Success']
      redirect_to match_room_path(@match_room)
    else
      flash[:errors] = ['Error']
      redirect_to match_room_index_path
    end
  end
end
