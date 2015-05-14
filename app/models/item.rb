class Item < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 2}

  paginates_per 15

  def self.latest_items
    order(created_at: :desc).limit(10)
  end

end
