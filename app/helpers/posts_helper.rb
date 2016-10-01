module PostsHelper
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end
end
