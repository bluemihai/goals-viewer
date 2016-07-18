json.array!(@reviews) do |review|
  json.extract! review, :id, :player_id, :goal_id, :interest, :clarity, :difficulty_anticipated, :difficulty_hindsight, :relevance, :comments_before, :comments_after
  json.url review_url(review, format: :json)
end
