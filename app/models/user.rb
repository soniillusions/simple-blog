class User < ApplicationRecord
  before_create :generate_random_username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :posts, dependent: :destroy
  has_one_attached :avatar
  has_one_attached :avatar_resized

  validates :avatar, blob: { content_type: :image } # supported options: :web_image, :image, :audio, :video, :text
  validates :username, uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 20 },
            presence: true,
            if: -> { persisted? && username_changed? }

  def author?(obj)
    obj.user == self
  end

  def guest?
    false
  end

  def resize_avatar
    image = MiniMagick::Image.read(avatar.download)
    image.resize "400x400"
    filename = "avatar_resized_#{SecureRandom.uuid}.jpg"
    path = Rails.root.join('tmp', filename)
    image.write(path)

    avatar_resized.attach(
      io: File.open(path),
      filename: filename,
      content_type: "image/jpeg"
    )

    File.delete(path)
  end

  private

  def generate_random_username
    self.username = "user#" + SecureRandom.hex(6)
  end
end