namespace :sync do
  desc "TODO"
  task players: :environment do
    puts "Ran players"
  end

  desc "TODO"
  task goals: :environment do
    puts Goal.sync_all
  end

  desc "TODO"
  task all: :environment do
    puts "Ran all"
  end

end
