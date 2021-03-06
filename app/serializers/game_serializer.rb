class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [ScoreSerializer.new(User.find(object.player_1_id)), ScoreSerializer.new(User.find(object.player_2_id))]
  end
end
