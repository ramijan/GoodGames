class SearchController < ApplicationController

  def results
    if params[:query] && params[:query] != ''
      @results = get_giant_bomb_data(params[:query], 'name,image,api_detail_url,original_release_date')
    end
  end

end
