class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_if_logged_in
    if !session[:user]
      redirect_to '/users/new'
    end
  end
end
