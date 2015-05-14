class Page < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2}
  validates :content, presence: true, length: {minimum: 2}

  paginates_per 15

  def primary_value
    primary ? 'Да' : 'Нет'
  end
end
