# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'net/http'
require 'json'

url = URI.parse("http://www.giantbomb.com/api/search/?api_key=b038c70b0015dfe2aa7b79b78386907fb0f2d850&format=json&query=%22mass%20effect%22&resources=game&field_list=name,image,deck,original_release_date,platforms,id")
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}

games = JSON.parse(res.body)

games['results'].each do |game|
  Game.create(name: game['name'], deck: game['deck'], image_urls: game['image'], release_date: game['original_release_date'], platforms: game['platforms'], resource_id: game['id'] )
end