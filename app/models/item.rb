class Item < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', :foreign_key => 'source_id',  dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 2}

  paginates_per 15
end
