class Comment < ActiveRecord::Base
  belongs_to :item
  belongs_to :author, class_name: "User"

  validates :text, presence: true
end
