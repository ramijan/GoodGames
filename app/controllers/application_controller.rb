class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user
  end

  def get_giant_bomb_data(query, field_list, game_id='')
    return {} if query=='' || query==nil

    key = Rails.application.secrets.giant_bomb_key
    raw_uri = ''
    if game_id == ''
      raw_uri = "http://www.giantbomb.com/api/search/?api_key=#{key}&format=json&query=#{query}&resources=game&field_list=#{field_list}"
    else
      raw_uri = "http://www.giantbomb.com/api/game/#{game_id}/?api_key=#{key}&format=json"
    end
    url = URI.parse(raw_uri)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
    return JSON.parse(res.body)['results']
  end
  
end
