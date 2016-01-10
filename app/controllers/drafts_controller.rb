class DraftsController < ApplicationController
   before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]

  def index
    @drafts = Draft.all
  end

  def show
    @draft = Draft.find(params[:id])
  end

  def new
  end

  def create
    @draft = Draft.new(params.require(:draft).permit(:player, :round, :bachelor)) 
    @draft.save
    redirect_to @draft  
  end
end