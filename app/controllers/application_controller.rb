class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_if_logged_in
    if !session[:user]
      puts "NOT LOGGED IN"
      redirect_to '/users/new'
    end
  end
end
