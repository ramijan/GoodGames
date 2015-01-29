class UsersController < ApplicationController

  before_action :authorize, only: [:show, :games, :update]

  def show
    @user = User.find(params[:id])
  end


  def new
    redirect_to games_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to user_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def photo
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:photo))
    redirect_to user_path
  end

  def update  #update
    @user = User.find(params[:id])
    @game = Game.find(params[:game_id])
    @gameslist = ['games', 'games_played', 'games_playing', 'games_want']

    case params[:to]
      when 'games_played'
        @user.games_playing.delete(params[:game_id])
        @user.games_want.delete(params[:game_id])
        @user.games_played << params[:game_id] unless @user.games_played.include? params[:game_id]
      when 'games_want'
        @user.games_playing.delete(params[:game_id])
        @user.games_played.delete(params[:game_id])
        @user.games_want << params[:game_id] unless @user.games_played.include? params[:game_id]
      when 'games_playing'
        @user.games_played.delete(params[:game_id])
        @user.games_want.delete(params[:game_id])
        @user.games_playing << params[:game_id] unless @user.games_played.include? params[:game_id]
    end
      @user.save
      redirect_to user_games_path(@user)
  end

  def games
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :photo, :password, :password_confirmation)
    end
end