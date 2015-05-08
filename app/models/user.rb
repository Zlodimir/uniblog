class User < ActiveRecord::Base
  has_many :items
  has_many :pages
  has_many :articles
  #has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
  
  #has_many :assets, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :lastname, presence: true, length: {minimum: 2}
  validates :firstname, presence: true, length: {minimum: 2}

  def to_s
  	#"#{firstname} #{lastname} #{email} (#{admin? ? 'Админ' : 'Пользователь'})"
    "#{firstname} #{lastname} #{email}"
  end
end
