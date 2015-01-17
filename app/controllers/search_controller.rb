class SearchController < ApplicationController

def results
  if params[:query] && params[:query] != ''
    key = Rails.application.secrets.giant_bomb_key
    url = URI.parse("http://www.giantbomb.com/api/search/?api_key=#{key}&format=json&query=#{params[:query]}&resources=game")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
    @results = JSON.parse(res.body)['results']
  else
    @results = {}
  end

end


end
