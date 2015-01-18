require 'net/http'
require 'json'

class GamesController < ApplicationController

  def index

  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    # check if game is already in db
    @game = Game.find_by(giant_bomb_game_id: params[:game_id])

    # if not, get data from giant bomb
    if @game.nil?
      gb_data = get_giant_bomb_data('stuff', '', params[:game_id])
      @game = Game.create(name: gb_data['name'], image: gb_data['image'], giant_bomb_game_id: params[:game_id])
    end

    # push game into user game list
    current_user.games << @game

    # redirect to game details screen
    redirect_to game_path(@game)
  end

end