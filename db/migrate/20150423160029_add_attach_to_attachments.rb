class AddAttachToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :attach, :string
  end
end
