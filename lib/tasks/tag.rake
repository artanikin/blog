namespace :tag do
  desc "Creates fake tag object"
  task :create => :environment do |_, args|
    counter = 0
    tags = %w(ruby html css vim terminal bash ssh git coffeescript javascript bootstrap)

    tags.each do |tag|
      counter += 1 if Tag.create(name: tag)
    end

    puts "Was created #{counter} tags"
  end
end
