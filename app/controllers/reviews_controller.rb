class ReviewsController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params.require(:review).permit(:rating, :title, :body))
    @review.user = current_user
    @review.game = Game.find(params[:game_id])

    if @review.save
      redirect_to game_path(params[:game_id])
    else
      render :new
    end

  end

end