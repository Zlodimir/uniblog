class RemoveFilenameFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :filename
  end
end
