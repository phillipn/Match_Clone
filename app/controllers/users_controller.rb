class UsersController < ApplicationController
  before_action :check_if_logged_in, except: [:new, :create, :login]
  before_action :completed_survey, except: [:new, :create, :login, :post_personality_survey, :personality_survey, :personal_survey, :post_personal_survey, :logout]

  def index
    @match_room = MatchRoom.new
    @current_user = UserInfo.where(user_id: session[:user]['id']).first
    istj = {best: ["ESTJ", "ISTJ", "INTJ", "ISTP", "ESTP" ], ok: ["ENTJ", "INTP", "ENFJ", "INFJ", "ISFJ", "ISFP", "ENTP"], worst: ["ESFJ", "ESFP", "ENFP", "INFP"], population: 14}
    istp = {best: ["ESTJ", "ISTJ", "ENTJ", "ESTP"], ok: ["ESFJ", "ISFP", "INTJ", "ISFJ"], worst: ["ISTP", "ESFP", "ENTP", "INTP", "ENFJ", "INFJ", "ENFP", 'INFP'], population: 6}
    estp = {best: ["ISTJ", "ESTP", "ISTP", "ESFP"], ok: ["ESTJ", "ISFP", "ENTJ", "ENTP", "INTP", "ISFJ"],worst: ["ESFJ", "INTJ", "ENFJ", "INFJ", "ENFP", "INFP"],population: 6}
    estj = {best: ["ISTJ", "ESFJ", "ISFJ", "ENTJ", "INTJ", "ISTP"],ok: ["ENTP", "INTP", "ESTP", "ESFP", "ISFP"],worst: ["ESTJ", "ENFJ", "INFJ", "INFP", "ENFP"],population: 11}
    isfj = {best: ["ISFJ", "ENFJ", "ESTJ"], ok: ["ESFJ", "ESTP", "ISFP", "INFJ", "INFP", "ESFP", "ISTJ", "ISFP"],worst: ["ENTJ", "INTJ", "ENTP", "INTP", "ENFP"],population: 10.5}
    isfp = {best: ["ESFP", "ISFP"], ok: ["ESTP", "ESTJ", "ESFJ", "ISTP", "ENFJ", "INFJ", "INFP", "ISFJ", "ISTJ", "ENFP"],worst: ["ENTJ", "INTJ", "ENTP", "INTP"],population: 6}
    espf = {best: ["ESTP", "ISFP"], ok: ["ESTJ", "ESFJ", "ISFJ", "ESFP", "ENTP", "ENFJ", "INFJ", "ENFP", "INFP"],worst: ["ISTJ", "ISTP", "ENTJ", "INTJ", "INTP"],population: 7.5}
    esfj = {best: ["ESTJ", "ENFP"], ok: ["ISFJ", "ESFJ", "ENFJ", "INFP", "ISFP", "ISTP", "ESFP"],worst: ["ESTP", "ENTJ", "INTJ", "ENTP", "INTP", "INFJ", "ISTJ"],population: 11}
    infj = {best: ["ENTP", "ENFP", "INFJ", "INFP", "ENFJ"], ok: ["ISFJ", "ESFP", "ISFP", "ENTJ", "INTJ", "INTP", "ISTJ"],worst: ["ESTJ", "ESFJ", "ESTP", "ISTP"],population: 2.5}
    infp = {best: ["ENFP", "INFP", "ENFJ", "INFJ"], ok: ["ISFJ", "ESFJ", "ESFP", "ISFP", "ENTP", "INTP"],worst: ["ESTJ", "ISTJ", "ESTP", "ISTP", "ENTJ", "INTJ"],population:  4.5}
    enfp = {best: ["INFJ", "INFP", "ENFJ", "ENFP", "ESFJ"], ok: ["ENTJ", "ENTP", "INTJ", "INTP","ESFP", "ISFP"],worst: ["ISTJ", "ESTJ", "ISTP", "ESTP", "ISFJ"],population: 7}
    enfj = {best: ["ISFJ", "ENFJ", "ENTJ", "INFJ", "ENFP", "INFP"],ok: ["ESFJ", "ESFP", "ISFP", "INTP", "ISTJ", "ENTP"],worst: ["ESTJ", "ESTP", "ISTP", "INTJ"],population: 4}
    intj = {best: ["ESTJ", "INTJ", "ISTP", "ENTJ"], ok: ["INTP", "INFJ", "INFP", "ENFP"],worst: ["ESFJ", "ISFJ", "ESTP", "ESFP", "ISFP", "ENTP", "INFP", "ENFJ"],population: 3.5}
    intp = {best: ["ENTP", "INTP", "INTJ"], ok: ["ESTJ", "ISTJ", "ESTP", "ENTJ", "ENFJ", "INFJ", "ENFP", "INFP"],worst: ["ESFJ", "ISFJ", "ISTP", "ESFP", "ISFP"],population: 5.5}
    entp = {best: ["ENTP", "INTP", "INFJ"], ok: ["ESTJ", "ISTJ", "ESTP", "ESFP", "ENTJ", "ENFP", "INFP", "ENFJ"],worst: ["ESFJ", "ISFJ", "ISTP", "ISFP", "INTJ"],population: 6}
    entj = {best: ["ESTJ", "ISTP", "ENTJ", "ENFJ", "INTJ"], ok: ["ISTJ", "ESTP", "ENTP", "INTP", "INFJ", "ENFP"],worst: ["ESFJ", "ISFJ", "ESFP", "ISFP", "INFP"],population: 4}
    puts "CURRENT USER #{@current_user}"
    if @current_user.personality == "ISTJ"
      relationships = istj
    elsif @current_user.personality == "ISTP"
      relationships = istp
    elsif @current_user.personality == "ESTP"
      relationships = estp
    elsif @current_user.personality == "ESTJ"
      relationships = estj
    elsif @current_user.personality == "ISFJ"
      relationships = isfj
    elsif @current_user.personality == "ISFP"
      relationships = isfj
    elsif @current_user.personality == "ESPF"
      relationships = espf
    elsif @current_user.personality == "ESFJ"
      relationships = esfj
    elsif @current_user.personality == "INFJ"
      relationships = infj
    elsif @current_user.personality == "INFP"
      relationships = infg
    elsif @current_user.personality == "ENFG"
      relationships = enfg
    elsif @current_user.personality == "ENFJ"
      relationships = enfj
    elsif @current_user.personality == "INTJ"
      relationships = intj
    elsif @current_user.personality == "INTP"
      relationships = intp
    elsif @current_user.personality == "ENTP"
      relationships = entp
    elsif @current_user.personality == "ENTJ"
      relationships = entj
    end
    @possible_matches = UserInfo.where(personality: ["ESTJ", "ISTJ", "INTJ", "ISTP", "ESTP", "ENTJ", "INTP", "ENFJ", "INFJ", "ISFJ", "ISFP", "ENTP","ESFJ", "ESFP", "ENFP", "INFP"]).where.not(user_id: session[:user]['id'])
    @ranking = {}
    @possible_matches.each do |match|
      if relationships[:best].include?(match.personality)
        @ranking[match.user_id] = rand(150..160)
      elsif relationships[:ok].include?(match.personality)
        @ranking[match.user_id] = rand(90..110)
      else
        @ranking[match.user_id] = rand(40..50)
      end
    end
    @possible_matches.each do |match|
      match_age = Date.today.year - match.birthday.year
      match_age -= 1 if Date.today < match.birthday + match_age.years
      if @current_user.smoke && match.date_smoke || !@current_user.smoke
        @ranking[match.user_id] += rand(5..7)
      elsif @current_user.kids && match.date_kids || !@current_user.kids
         @ranking[match.user_id] += rand(5..7)
      elsif @current_user.want_kids && match.want_kids
         @ranking[match.user_id] += rand(5..7)
      elsif @current_user.tattoo && match.date_tattoo || !@current_user.tattoo
         @ranking[match.user_id] += rand(5..7)
      elsif @current_user.date_religion && match.date_religion || !@current_user.date_religion && @current_user.religion == match.religion || !match.date_religion && @current_user.religion == match.religion
         @ranking[match.user_id] += rand(5..7)
      elsif @current_user.pet && match.date_pet || !@current_user.pet
         @ranking[match.user_id] += rand(5..7)
      elsif @current_user.date_politics && match.date_politics || !@current_user.date_politics && @current_user.politics == match.politics || !match.date_politics && @current_user.politics == match.politics
         @ranking[match.user_id] += rand(5..7)
      elsif match_age >= @current_user.min_age && match_age<= @current_user.max_age
         @ranking[match.user_id] += rand(5..7)
      end
    end
  end

  def post_personality_survey
    if params.length != 35
      flash[:errors] = ["Need to Complete all Survey Questions"]
      redirect_to '/survey/personality'
    else
      ie = 30 - params["3"].to_i  - params["7"].to_i  - params["11"].to_i  + params["15"].to_i  - params["19"].to_i  + params["23"].to_i  + params["27"].to_i  - params["31"].to_i
      sn = 12 + params["4"].to_i + params["8"].to_i + params["12"].to_i + params["16"].to_i + params["20"].to_i - params["24"].to_i - params["28"].to_i + params["32"].to_i
      ft = 30 - params["2"].to_i + params["6"].to_i + params["10"].to_i  - params["14"].to_i - params["18"].to_i + params["22"].to_i - params["26"].to_i - params["30"].to_i
      jp = 18 + params["1"].to_i + params["5"].to_i - params["9"].to_i + params["13"].to_i - params["17"].to_i + params["21"].to_i - params["25"].to_i + params["29"].to_i
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
      id = UserInfo.find_by(user_id: session[:user]['id'])
      id = id.id
      user = UserInfo.update(id, :personality => oejts)
      redirect_to '/survey/personal'
    end
  end

  def personality_survey
     id = UserInfo.find_by(user_id: session[:user]['id'])
     if id.personality
       flash[:errors] = ["Already Completed Personality Survey"]
       redirect_to '/'
      end
  end

  def personal_survey
    id = UserInfo.find_by(user_id: session[:user]['id'])
     if id.min_age
       flash[:errors] = ["Already Completed Personal Survey"]
       redirect_to '/'
      end
  end

  def post_personal_survey
    id = UserInfo.find_by(user_id: session[:user]['id'])
    id = id.id
    if params[:kids].downcase == 'yes'
      params[:kids] = true
    else
      params[:kids] = false
    end
    if params[:date_kids].downcase == 'yes'
      params[:date_kids] = true
    else
      params[:date_kids] = false
    end
    if params[:want_kids].downcase == 'yes'
      params[:want_kids] = true
    else
      params[:want_kids] = false
    end
    if params[:date_politics].downcase == 'yes'
      params[:date_politics] = true
    else
      params[:date_politics] = false
    end
    if params[:smoke].downcase == 'yes'
      params[:smoke] = true
    else
      params[:smoke] = false
    end
    if params[:date_smoke].downcase == 'yes'
      params[:date_smoke] = true
    else
      params[:date_smoke] = false
    end
    if params[:tattoo].downcase == 'yes'
      params[:tattoo] = true
    else
      params[:tattoo] = false
    end
    if params[:date_tattoo].downcase == 'yes'
      params[:date_tattoo] = true
    else
      params[:date_tattoo] = false
    end
    if params[:date_religion].downcase == 'yes'
      params[:date_religion] = true
    else
      params[:date_religion] = false
    end
    if params[:pet].downcase == 'yes'
      params[:pet] = true
    else
      params[:pet] = false
    end
    if params[:date_pet].downcase == 'yes'
      params[:date_pet] = true
    else
      params[:date_pet] = false
    end
    info = UserInfo.update(id, :max_age => params[:min_age], :min_age => params[:max_age], :hair => params[:hair], :eye => params[:eye], :education => params[:education], :kids => params[:kids], :date_kids => params[:date_kids], :want_kids => params[:want_kids], :politics => params[:politics], :date_politics => params[:date_politics], :smoke => params[:smoke], :date_smoke => params[:date_smoke], :tattoo => params[:tattoo], :date_tattoo => params[:date_tattoo], :religion => params[:religion], :date_religion => params[:date_religion], :pet => params[:pet], :date_pet => params[:date_pet], :birthday => params[:birthday])
    if info.errors.full_messages[0]
     flash[:errors] = info.errors.full_messages
     redirect_to '/survey/personal'
    else
      redirect_to '/'
    end
  end

  def new
  end

  def create
    if params[:password] == params[:password_confirm]
      user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], sex: params[:sex], orientation: params[:orientation], picture: '/uploads/user/picture/default.jpg')
      if user.errors.full_messages[0]
        flash[:errors] = user.errors.full_messages
        redirect_to '/users/new'
      else
        userinfo = UserInfo.create(user_id:user.id)
      if userinfo.errors.full_messages[0]
        flash[:errors] = user.errors.full_messages
        redirect_to '/users/new'
      else
        userprof = Profile.create(user_id:user.id)
        if userprof.errors.full_messages[0]
          flash[:errors] = user.errors.full_messages
          redirect_to '/users/new'
        else
          session[:user] = {first_name: user.first_name, id: user.id}
          redirect_to '/survey/personality'
        end
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
    @match_room = MatchRoom.new
    @user = User.find(params[:id])
    @userinfo = UserInfo.find_by(user_id: params[:id])
    @userprof = Profile.find_by(user_id: params[:id])
    puts @userprof.inspect
  end

  def edit
    @user = User.find(params[:id])
    @userinfo = UserInfo.find_by(user_id: params[:id])
    @userprof = Profile.find_by(user_id: params[:id])
    puts @user.inspect
    puts @userinfo.inspect
    puts "USER PROFILE====== #{@userprof.inspect}"
  end

  def update
      user = User.find_by(id: params[:id])
      user.picture = params[:picture]
      user.save

      userinfo = UserInfo.find_by(user_id: params[:id])
      userinfo.max_age = params[:max_age]
      userinfo.min_age = params[:min_age]
      userinfo.education = params[:education]
      userinfo.save

      userprof = Profile.find_by(user_id: params[:id])
      userprof.about_me = params[:about_me]
      userprof.ideal_mate = params[:ideal_mate]
      userprof.job = params[:job]
      userprof.religion = params[:religion]
      userprof.hobbies = params[:hobbies]
      userprof.save

      redirect_to users_show_path
  end

  def accountUpdate
    user = User.find(session[:user]['id'])
    if params[:password] == params[:password_confirm]
      user.password = params[:password]
      user.email = params[:email]
      user.save
    else
      flash[:errors]= user.errors.full_messages.inspect
    end
  end

  private
  def user_params
    params.require(:user).permit(:personality,:max_age,:min_age,:job,:hobbies,:religion,:ideal_mate,:about_me,:password,:password_confirm)
  end
end
