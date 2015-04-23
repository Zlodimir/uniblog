class Comment < ActiveRecord::Base
  belongs_to :item, class_name: "Item"
  belongs_to :page, class_name: "Page"
  belongs_to :author, class_name: "User"

  validates :text, presence: true
end
