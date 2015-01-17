require 'net/http'
require 'json'

class GamesController < ApplicationController

  def index

  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    puts params.inspect
    redirect_to search_path
  end

end