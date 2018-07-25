class Api::V1::PlaysController < ActionController::API
  def create
    play = Play.new(play_params.merge(game_id: params[:id]))
    redirect_to controller: 'games', action: 'show', status: "201 Created" if play.save
  end

  private

  def play_params
    params.require(:plays).permit(:word, :user_id)
  end
end