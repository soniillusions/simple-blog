class Post < ApplicationRecord
  include Authorship
  include Commentable

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :body, presence: true, length: { minimum: 1, maximum: 2000 }

  belongs_to :user
end
