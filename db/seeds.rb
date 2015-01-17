require 'net/http'
require 'json'

url = URI.parse("http://www.giantbomb.com/api/search/?api_key=b038c70b0015dfe2aa7b79b78386907fb0f2d850&format=json&query=%22dying%20light%22&resources=game")
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}

games = JSON.parse(res.body)

games['results'].each do |game|
  Game.create(
    api_detail_url: game['api_detail_url'],
    deck: game['deck'], 
    expected_release_day: game['expected_release_day'],
    expected_release_month: game['expected_release_month'],
    expected_release_quarter: game['expected_release_quarter'],
    expected_release_year: game['expected_release_year'],
    giant_bomb_id: game['id'],
    image: game['image'], 
    name: game['name'], 
    original_release_date: game['original_release_date'], 
    platforms: game['platforms'], 
    site_detail_url: game['site_detail_url'] 
  )
end