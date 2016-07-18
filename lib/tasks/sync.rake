namespace :sync do
  desc "TODO"
  task players: :environment do
    puts User.import_all
  end

  desc "TODO"
  task goals: :environment do
    puts Goal.sync_all
  end

  desc "TODO"
  task all: :environment do
    puts User.import_all
    puts Goal.sync_all
  end

end
