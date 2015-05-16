class User < ActiveRecord::Base
  has_many :items
  has_many :pages
  has_many :articles

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :lastname, presence: true, length: { minimum: 2 }
  validates :firstname, presence: true, length: { minimum: 2 }

  def to_s
    "#{firstname} #{lastname} #{email}"
  end
end
