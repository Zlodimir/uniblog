class Item < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :author, class_name: "User"

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 2}

  paginates_per 15
  
end
