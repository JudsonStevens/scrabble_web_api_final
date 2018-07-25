class ScoreSerializer < ActiveModel::Serializer
  attributes :user_id, :score

  def user_id
    object.id
  end

  def score
    object.plays.map { |play| play.score }.inject(&:+)
  end
end
