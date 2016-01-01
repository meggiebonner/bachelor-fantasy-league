class PicksController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
  before_filter :save_login_state, :only => [:index, :login, :login_attempt]
 
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