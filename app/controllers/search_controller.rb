class SearchController < ApplicationController

  def results

    if params[:query] && params[:query] != ''
      key = Rails.application.secrets.giant_bomb_key
      url = URI.parse("http://www.giantbomb.com/api/search/?api_key=#{key}&format=json&query=#{params[:query]}&resources=game")
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
      @results = JSON.parse(res.body)['results']
      
      @results.each do |result|
        Game.create(
          api_detail_url: result['api_detail_url'],
          deck: result['deck'], 
          expected_release_day: result['expected_release_day'],
          expected_release_month: result['expected_release_month'],
          expected_release_quarter: result['expected_release_quarter'],
          expected_release_year: result['expected_release_year'],
          giant_bomb_id: result['id'],
          image: result['image'], 
          name: result['name'], 
          original_release_date: result['original_release_date'], 
          platforms: result['platforms'], 
          site_detail_url: result['site_detail_url'] 
        )
      end
    end
  end
end
