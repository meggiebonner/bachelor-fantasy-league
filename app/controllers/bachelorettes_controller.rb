class BachelorettesController < ApplicationController
  def index
    @bachelorettes = Bachelorette.all
  end
end
