class UsersController < ApplicationController
  before_action :check_if_logged_in, except: [:new, :create, :login]

  def index
    @users = User.all
  end

  def post_personality_survey
    if incomplete
      redirect_to '/survey/personality'
    else
      user = UserInfo.find_by(user_id: session[:user]["id"])
      puts "USER #{user}"
      ie = 30 - params["3"].to_i  - params["7"].to_i  - params["11"].to_i  + params["15"].to_i  - params["19"].to_i  + params["23"].to_i  + params["27"].to_i  - params["31"].to_i
      sn = 12 + params["4"].to_i + params["8"].to_i + params["12"].to_i + params["16"].to_i + params["20"].to_i - params["24"].to_i - params["28"].to_i + params["32"].to_i
      ft = 30 - params["2"].to_i + params["6"].to_i + params["10"].to_i  - params["14"].to_i - params["18"].to_i + params["22"].to_i - params["26"].to_i - params["30"].to_i
      jp = 18 + params["1"].to_i + params["5"].to_i - params["9"].to_i + params["13"].to_i - params["17"].to_i + params["21"].to_i - params["25"].to_i + params["29"].to_i
      puts "RESULTS #{ie}, #{sn}, #{ft}, #{jp}"
      oejts = ''
      if ie > 24
        oejts = oejts + 'E'
      else
        oejts = oejts + 'I'
      end

      if sn > 24
        oejts = oejts + 'N'
      else
        oejts = oejts + 'S'
      end

      if ft > 24
        oejts = oejts + 'T'
      else
        oejts = oejts + 'F'
      end

      if jp > 24
        oejts = oejts + 'P'
      else
        oejts = oejts + 'J'
      end
      user.personality = oejts
      user.save
      redirect_to '/survey/personal'
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
        userinfo = UserInfo.create(user_id:user.id)
        if userinfo.errors.full_messages[0]
          flash[:errors] = user.errors.full_messages
          redirect_to '/users/new'
        else
          session[:user] = {first_name: user.first_name, id: user.id}
          redirect_to '/survey'
        end
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
        session[:user] = {first_name: user.first_name, id: user.id}
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
    @user = User.find(params[:id])
  end
end
