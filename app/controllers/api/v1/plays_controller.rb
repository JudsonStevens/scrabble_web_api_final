class Api::V1::PlaysController < ActionController::API
  def create
    play = Play.new(play_params.merge(game_id: params[:id]))
    if play.save
      redirect_to controller: 'games', action: 'show', status: 201
    end
  end

  private

  def play_params
    params.require(:plays).permit(:word, :user_id, :game_id)
  end
end