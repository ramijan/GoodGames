module ApplicationHelper

  def get_id(game)
    game['api_detail_url'].match(/\d+-\d+/).to_s
  end

end
