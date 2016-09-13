class Post < ApplicationRecord
  validates :title, :summary, :body, presence: true
end
