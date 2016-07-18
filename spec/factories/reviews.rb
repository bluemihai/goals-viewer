FactoryGirl.define do
  factory :review do
    player_id 1
    goal_id 1
    interest 1
    clarity 1
    difficulty_anticipated 1
    difficulty_hindsight 1
    relevance 1
    comments_before "MyText"
    comments_after "MyText"
  end
end
