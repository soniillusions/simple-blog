class Post < ApplicationRecord
  include Authorship
  include Commentable

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :body, presence: true, length: { minimum: 1, maximum: 2000 }

  belongs_to :user

  scope :all_by_tags, ->(tags) do
    posts = includes(:user)
    if tags
      posts = posts.joins(:tags).where(tags: tags).preload(:tags)
    else
      posts = posts.includes(:post_tags, :tags)
    end

    posts.order(created_at: :desc)
  end
end
