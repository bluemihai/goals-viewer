class Goal < ApplicationRecord
  extend Importable

  def issue_path
    "http://github.com/GuildCrafts/web-development-js/issues/#{id}"
  end

  def title
    return 'None' unless github_import && github_import['title']
    github_import['title']
  end

  def created_by
    return 'None' unless github_import && github_import['user']
    github_import['user']['login']
  end

  def created
    return 'None' unless github_import && github_import['created_at']
    DateTime.strptime(github_import['created_at'])
  end
  
  def self.create_from_github(goal_id)
    goal_json = github("https://api.github.com/repos/GuildCrafts/web-development-js/issues/#{goal_id.to_s}")

    existing = Goal.find_or_initialize_by(id: goal_id)
    if existing.persisted?
      puts "Updating goal ##{goal_id}."
      existing.update(github_import: goal_json)
    else
      puts "Creating goal ##{goal_id}."
      create! do |goal|
        goal.id = goal_id
        goal.github_import = goal_json
      end
    end
  end

  def self.importable_ids
    goal_json = github('https://api.github.com/repos/GuildCrafts/web-development-js/issues')
    goal_json.map{ |g| g["number"] }
  end

  def self.sync_all
    importable_ids.map{ |id| create_from_github(id) }
  end

  def self.last_update
    all.map(&:updated_at).max
  end
end
