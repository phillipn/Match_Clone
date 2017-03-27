class UsersController < ApplicationController
  def index
    
  end
  def survey
    
  end
  def new
    
  end
  def create
    
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
