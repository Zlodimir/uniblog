class Attachment < ActiveRecord::Base
  mount_uploader :attach, AttachmentUploader
  belongs_to :article
end
