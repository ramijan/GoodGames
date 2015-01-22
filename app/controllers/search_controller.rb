class SearchController < ApplicationController

  def results
    @all_games = Game.all
    @my_games = current_user.games

    if params[:query] && params[:query] != ''
      @results = Giantbomb.search(params[:query], 'name,image,api_detail_url,original_release_date')
    else
      @results = []
    end
  end

end
