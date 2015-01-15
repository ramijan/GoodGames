class GamesController < ApplicationController
  before_action :authorize


  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

end