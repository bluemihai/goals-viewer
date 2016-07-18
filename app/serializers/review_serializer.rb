class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :goal_id, :interest, :clarity, :difficulty_anticipated, :difficulty_hindsight, :relevance, :comments_before, :comments_after
end
