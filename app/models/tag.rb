class Tag < ApplicationRecord

  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("name, taggings.tag_id")
  end

end
