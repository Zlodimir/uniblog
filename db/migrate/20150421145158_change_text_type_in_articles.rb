class ChangeTextTypeInArticles < ActiveRecord::Migration
  def change
    change_column :articles, :text, :text
  end
end
