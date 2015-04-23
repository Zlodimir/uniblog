class Page < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :comments, class_name: "Comment", :foreign_key => 'source_id',  dependent: :destroy

  validates :name, presence: true, length: {minimum: 2}
  validates :content, presence: true, length: {minimum: 2}

  paginates_per 15
end
