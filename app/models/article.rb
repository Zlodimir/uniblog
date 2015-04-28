class Article < ActiveRecord::Base
  has_many :attachments
  belongs_to :author, class_name: "User"
  
end

