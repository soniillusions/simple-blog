class User < ApplicationRecord
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

  validates :avatar, presence: true, blob: { content_type: :image } # supported options: :web_image, :image, :audio, :video, :text

  def author?(obj)
    obj.user == self
  end

  def guest?
    false
  end

  def resize_avatar
    image = MiniMagick::Image.read(avatar.download)
    image.resize "100x100"
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
end