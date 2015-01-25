class GamesController < ApplicationController

  def index

  end

  def show
    @game = Game.find(params[:id])
    @review = @game.reviews.find_by(user_id: current_user.id) if current_user && @game
    @gb_data = Giantbomb.game(params[:id])
  end

  def create
    # check if game is already in db
    @game = Game.find_by(giant_bomb_game_id: params[:game_id])

    # if not, get data from giant bomb
    if @game.nil?
      gb_data = Giantbomb.game(params[:game_id])
      @game = Game.create(name: gb_data['name'], 
                          image: gb_data['image'], 
                          developer: (gb_data['developers'][0]['name'] if gb_data['developers']), 
                          publisher: (gb_data['publishers'][0]['name'] if gb_data['publishers']), 
                          giant_bomb_game_id: params[:game_id]
              )
    end

    # push game into user game list
    current_user.games << @game

    # redirect to game details screen
    redirect_to user_games_path(current_user)
  end

end