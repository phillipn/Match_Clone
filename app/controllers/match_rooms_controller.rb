class MatchRoomsController < ApplicationController
  before_action :interested_party?, only: :show
  before_action :check_if_logged_in

  def index
    @matches_sent = MatchRoom.where("sender_id = ? and (status = 'Open' or status = 'Pending')", session[:user]['id'])
    @matches_received = MatchRoom.where("receiver_id = ? and (status = 'Open' or status = 'Pending')", session[:user]['id'])
    @breakups = MatchRoom.where("receiver_id = ? or sender_id = ? and status='Closed'", session[:user]['id'], session[:user]['id'])
  end

  def show
    @message = Message.new
    @match_room = MatchRoom.find(params[:id])
    puts @match_room.inspect
    if @match_room.status == 'Closed' or @match_room.status == 'Pending'
      redirect_to root_path
    end
  end

  def create
    matches = matched?(session[:user]['id'], match_room_params[:receiver_id])
    redirect_to root_path and return if matches

    @match_room = MatchRoom.new(match_room_params)
    @match_room.status = 'Pending'
    @match_room.sender_id = session[:user]['id']

    if @match_room.save
      flash[:notice] = ['Success']
    else
      flash[:errors] = @match_room.errors.full_messages
    end

    redirect_to match_room_index_path
  end

  def update
    @match_room = MatchRoom.find(params[:id])
    @match_room.status = params["match_room"]["status"]

    puts @match_room.inspect

    if @match_room.save
      flash[:notice] = ['Success']
    else
      flash[:errors] = ['Error']
    end
    redirect_to match_room_index_path
  end

  private
    def match_room_params
      params.require(:match_room).permit(:receiver_id)
    end

    def matched?(sender_id, receiver_id)
      matches = MatchRoom.where("sender_id = ? AND receiver_id = ?", sender_id, receiver_id)
      if !matches.empty?
        flash[:errors] = ['You have aready requested a match']
        return true
      end
      return false
    end

    def interested_party?
      match_room = MatchRoom.find(params[:id])
      if !match_room or ((session[:user]['id'] != match_room.sender_id) and (session[:user]['id'] != match_room.receiver_id))
        redirect_to match_room_index_path
      end
    end
end
