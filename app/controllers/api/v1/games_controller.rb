class Api::V1::GamesController < ActionController::API

  def show
    require 'pry'; binding.pry
    render json: Game.find(params[:id])
  end

end