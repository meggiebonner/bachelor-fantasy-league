class ScoresController < ApplicationController
  def index
    @scores = Score.order("total DESC")
  end
end
