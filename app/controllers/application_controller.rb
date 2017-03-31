class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_if_logged_in
    if !session[:user]
      puts "NOT LOGGED IN"
      redirect_to '/users/new'
    end
  end

  # def completed_survey
  #   user = UserInfo.find_by(user_id: session[:user]['id'])
  #   if !user.personality
  #     redirect_to '/survey/personality'
  #   elsif !user.religion || !user.hair || !user.eye
  #     redirect_to '/survey/personal'
  #   end
  # end
end
