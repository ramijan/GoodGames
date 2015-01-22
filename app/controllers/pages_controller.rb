class PagesController < ApplicationController

  def welcome
    redirect_to user_games_path(current_user) if current_user
  end

  def contact
  end

  def about
  end

end