module Importable
  ADD_TOKEN = "?access_token=#{ENV['GITHUB_TOKEN']}"

  def github(path)
    JSON.parse eat(path + ADD_TOKEN)
  end
end