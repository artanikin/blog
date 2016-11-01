class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true

  has_ancestry
end
