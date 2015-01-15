class GamesController < ApplicationController
  before_action :authorize


  def index
    @games = Game.all
  end

end