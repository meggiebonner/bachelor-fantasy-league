class PicksController < ApplicationController
  http_basic_authenticate_with name: "bachelor", password: "password", except: [:index, :show]
 
  def index
    @picks = Pick.all
  end

  def show
    @pick = Pick.find(params[:id])
  end

  def new
  end

  def create
    @pick = Pick.new(params.require(:pick).permit(:player, :week, :rose, :tears)) 
    @pick.save
    redirect_to @pick  
  end

end