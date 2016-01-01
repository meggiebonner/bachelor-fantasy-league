class SignupsController < ApplicationController
#  http_basic_authenticate_with name: "bachelor", password: "2015season11", except: [:index, :show]
 
  def index
    @signups = Signup.all
  end

  def show
    @signup = Signup.find(params[:id])
  end

  def new
  end

  def create
    @signup = Signup.new(params.require(:signup).permit(:name, :email, :login, :password)) 
    @signup.save
    redirect_to @signup  
  end

end
