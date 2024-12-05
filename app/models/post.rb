class Post < ApplicationRecord
  include Authorship
  include Commentable

  belongs_to :user
end
