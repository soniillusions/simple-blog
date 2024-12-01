class Post < ApplicationRecord
  include Authorship

  belongs_to :user
end
