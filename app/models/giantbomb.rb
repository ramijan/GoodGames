require 'net/http'
require 'json'

class Giantbomb

  API_HOST = "www.giantbomb.com/api"
  API_KEY = ENV['GB_KEY']

  def self.search(query, field_list)

    return {} if query == nil

    url = URI.parse("http://#{API_HOST}/search/?api_key=#{API_KEY}&format=json&resources=game&query=#{query}&field_list=#{field_list}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
    return JSON.parse(res.body)['results']
  end

  def self.game(game_id)
    url = URI.parse("http://#{API_HOST}/game/#{game_id}/?api_key=#{API_KEY}&format=json")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
    return JSON.parse(res.body)['results']
  end

end