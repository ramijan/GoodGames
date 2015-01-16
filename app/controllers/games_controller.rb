require 'net/http'
require 'json'

class GamesController < ApplicationController

  def index
    if params[:query] && params[:query] != ''
      url = URI.parse("http://www.giantbomb.com/api/search/?api_key=b038c70b0015dfe2aa7b79b78386907fb0f2d850&format=json&query=#{params[:query]}&resources=game&field_list=name,image,deck,original_release_date,platforms,id")
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
      @games = JSON.parse(res.body)['results']
      # @games = Game.where(:name => /.*#{params[:query]}.*/)
    else
      @games = {}
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end