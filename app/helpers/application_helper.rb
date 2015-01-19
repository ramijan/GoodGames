module ApplicationHelper

  def get_id(game)
    game['api_detail_url'].match(/\d+-\d+/).to_s
  end

    #helper for displaying star ratings in games.html.erb
  def my_rating(game)
    review = current_user.reviews.find_by(game_id: game.id)
    if review
      return review.rating
    else
      return 0
    end
  end

end
