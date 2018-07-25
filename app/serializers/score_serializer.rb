class ScoreSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :user_id, :score

  def user_id
    object.id
  end

  def score
    object.plays.map do |play|
      play.score
    end.compact.inject(&:+)
  end
end
