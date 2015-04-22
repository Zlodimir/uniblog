class DeleteFkFromComments < ActiveRecord::Migration
  def change
  end
  remove_foreign_key(:comments, :column => :source_id)
end
