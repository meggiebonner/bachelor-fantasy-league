class SignupsController < ApplicationController
 
  def index
    @signups = Signup.all
  end

  def show
    @signup = Signup.find(params[:id])
  end

  def new

  end

  def create
    @signup = Signup.new(params.require(:signup).permit(:name, :email, :username, :password)) 
    @signup.save
    redirect_to @signup  
  end

end
