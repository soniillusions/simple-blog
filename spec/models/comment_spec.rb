require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'valid with valid attributes' do
      user = User.create(email: 'test@gmail.com')
      post = user.posts.build(body: 'post content here')
      comment = post.comments.build(body: 'comment content here', user: user)
      expect(comment).to be_valid
    end

    it 'not valid with invalid attributes' do
      user = User.create(email: 'test@gmail.com')
      post = user.posts.build(body: 'post content here')
      comment = post.comments.build(body: nil, user: user)
      expect(comment).not_to be_valid
    end

    it 'not valid with invalid user' do
      user = User.create(email: 'test@gmail.com')
      post = user.posts.build(body: 'post content here')
      comment = post.comments.build(body: 'comment content here', user: nil)
      expect(comment).not_to be_valid
    end
  end
end
