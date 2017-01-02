class UsersController < ApplicationController  
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to :action => :index
    else
      render "new"
    end
  end
  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end