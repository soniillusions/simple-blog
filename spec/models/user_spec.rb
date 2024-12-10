require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(email: 'test_email@gmail.com', password: '123321', password_confirmation: '123321')
      expect(user).to be_valid
    end

    it 'is not valid with different passwords' do
      user = User.new(email: 'test_email@gmail.com', password: '123321', password_confirmation: '111111')
      expect(user).not_to be_valid
    end

    it 'is not valid with invalid Email' do
      user = User.new(email: 'test_email.com', password: '123321', password_confirmation: '123321')
      expect(user).not_to be_valid
    end

    it 'is not valid without an Email' do
      user = User.new(email: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without password' do
      user = User.new(email: 'test_email@gmail.com')
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it 'can create a post' do
      user = User.create(email: 'test_email@gmail.com', password: '123321', password_confirmation: '123321')
      post = user.posts.build(body: 'post body')
      expect(post).to be_valid
      expect(post.user).to eq(user)
    end
  end

  describe 'callbacks' do
    it 'generates random username before create' do
      user = User.create(email: 'test_email@gmail.com', password: '123321', password_confirmation: '123321')
      expect(user.username).to match(/^user#[a-f0-9]{12}$/) # Регулярное выражение для проверки формата пароля
    end
  end

  describe '#guest?' do
    it 'returns false' do
      user = User.new(email: 'test_email@gmail.com')
      expect(user.guest?).to eq(false)
    end
  end
end
