namespace :category do
  desc "Creates fake category object"
  task :create => :environment do |_, args|
    counter = 0

    %w(Design Development).each do |category|
      counter += 1 if Category.create(name: category)
    end

    puts "Was created #{counter} categories"
  end
end
