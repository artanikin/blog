namespace :post do
  desc "Creates fake post object"
  task :create, [:count] => :environment do |_, args|
    args.with_defaults(count: 1)
    count = args[:count].to_i
    counter = 0
    categories_ids = all_categories_ids
    tag_names = Tag.pluck(:name)

    abort("Error! Count must be Integer and greater than 0") if count < 1
    abort("No categories in database") if categories_ids.empty?
    abort("No tags in database") if tag_names.empty?

    count.times do
      counter += 1 if create_post(categories_ids, tag_names)
    end

    puts "Was created #{counter} posts"
  end

  private

  def all_categories_ids
    Category.pluck(:id)
  end

  def create_post(categories_ids, tag_names)
    tags = []
    3.times { tags << tag_names.sample }

    params = {
      title: Faker::Lorem.sentence,
      summary: Faker::Lorem.paragraph,
      body: Faker::Lorem.paragraph,
      category_id: categories_ids.sample,
      all_tags: tags.uniq.join(', ')
    }

    Post.create(params)
  end
end
