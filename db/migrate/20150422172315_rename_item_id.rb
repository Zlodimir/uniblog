class RenameItemId < ActiveRecord::Migration
  def change
  	rename_column :comments, :item_id, :source_id
  end
  remove_foreign_key(:comments, :column => :item_id)
end
