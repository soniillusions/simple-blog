class Post < ApplicationRecord
  include Authorship
  include Commentable

  validates :body, presence: true, length: { minimum: 1, maximum: 2000 }

  belongs_to :user
end
