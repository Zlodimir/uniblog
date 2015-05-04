class Article < ActiveRecord::Base
  include Bootsy::Container
  has_many :attachments
  belongs_to :author, class_name: 'User'
  
end

