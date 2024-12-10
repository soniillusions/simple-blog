require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'valid with valid attribiutes' do
      user = User.create(email: 'test_email@gmail.com', password: '123321', password_confirmation: '123321')
      post = user.posts.build(body: 'post body')
      expect(post).to be_valid
    end

    it 'not valid without valid attributes' do
      user = User.create(email: 'test_email@gmail.com', password: '123321', password_confirmation: '123321')
      post = user.posts.build(body: nil)
      expect(post).not_to be_valid
    end

    it 'has valid author' do
      user = User.create(email: 'test_email@gmail.com', password: '123321', password_confirmation: '123321')
      post = user.posts.build(body: 'post body')
      expect(post.user).to eq(user)
    end
  end
end
