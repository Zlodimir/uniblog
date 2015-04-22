class AddFkToTables < ActiveRecord::Migration
  def change
  end
  add_foreign_key "comments", "items", column: "source_id"
end
