class Api::V1::GamesController < ActionController::API

  def show
    render json: Game.find(params[:id])
  end

end