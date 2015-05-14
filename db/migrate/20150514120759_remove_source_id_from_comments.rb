class RemoveSourceIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :source_id
  end
end
