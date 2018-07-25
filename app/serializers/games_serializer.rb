class GamesSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [ScoresSerializer.new(object.player_1_id), ScoresSerializer.new(object.player_2_id)]
  end
end
