class ScoresController < ApplicationController
  def index
    @scores = Score.order("total")
  end
end
