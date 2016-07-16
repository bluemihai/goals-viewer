json.array!(@goals) do |goal|
  json.extract! goal, :id, :github_import
  json.url goal_url(goal, format: :json)
end
