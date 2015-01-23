class ReviewsController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.game = Game.find(params[:game_id])

    if @review.save
      if params[:from_list]
        redirect_to user_games_path(current_user)
      else
        redirect_to game_path(params[:game_id])
      end
    else
      render :new
    end

  end

  def edit
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      if params[:from_list]
        redirect_to user_games_path(current_user)
      else
        redirect_to game_path(params[:game_id])
      end
    else
      render :edit
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end


end