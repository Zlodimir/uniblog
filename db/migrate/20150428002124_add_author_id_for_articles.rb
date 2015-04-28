class AddAuthorIdForArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author_id, :integer
  end
end
