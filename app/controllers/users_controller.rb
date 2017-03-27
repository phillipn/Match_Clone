class UsersController < ApplicationController
  before_action :check_if_logged_in

  def index
    
  end
  def post_personality_survey
    key = 1
    incomplete = false
    while key < 33
      unless params[key]
        flash[:errors] = ["Need to Complete All Questions"]
        incomplete = true
        key = key+1
      end 
    end
    if incomplete
      redirect_to '/survey/personality'
    else
      redirect_to '/'
    end
  end
  def personality_survey
    user = UserInfo.find_by(user_id: session[:user]["id"])
    if user
      flash[:errors] = ["Already Completed Survey"]
      redirect_to '/'
    else
      # render get /survey
    end
  end
  def personal_survey

  end
  def post_personal_survey

  end

  def new
  end
  def create
    puts params
    if params[:password] == params[:password_confirm]
      user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], sex: params[:sex], orientation: params[:orientation])
      if user.errors.full_messages[0]
        flash[:errors] = user.errors.full_messages
        redirect_to '/users/new'
      else
        session[:user] = {id: user.id}
        session[:user] = {first_name: user.first_name}
        redirect_to '/survey'
      end
    else
      flash[:errors] = ["Passwords Do Not Match"]
      redirect_to '/users/new'
    end
  end
  def login
    user = User.find_by(email:params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user] = {id: user.id}
        session[:user] = {first_name: user.first_name}
        redirect_to '/'
      else
        flash[:errors] = ["Incorrect Password"]
        redirect_to '/users/new'
      end

    else
      flash[:errors] = ["Email Spelled Incorrect or Not Registered"]
      redirect_to '/users/new'
    end
  end
  def logout
    session.clear
    redirect_to '/users/new'
  end
  def show
    check_if_logged_in
    @user = User.find(params[:id])
  end
end
