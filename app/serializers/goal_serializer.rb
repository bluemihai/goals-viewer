class GoalSerializer < ActiveModel::Serializer
  attributes :id, :title, :fake_rating
  
  def fake_rating
    rand(30..95)
  end
end
