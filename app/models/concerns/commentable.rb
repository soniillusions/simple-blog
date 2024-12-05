module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, -> { order(created_at: :desc) }, as: :commentable, dependent: :destroy
  end
end