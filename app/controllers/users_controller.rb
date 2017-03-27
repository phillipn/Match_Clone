class UsersController < ApplicationController
  def index
    
  end
  def survey
    session[:survey] = false
  end
  def new
    
  end
  def create
    session[:survey] =true
    redirect_to '/survey'
  end
  def login
    
  end
  def logout
    reset_session
    redirect_to '/users/new'
  end
  def show
    @user = User.find(params[:id])
  end
end
