class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :item, index: true
      t.references :author, index: true

      t.timestamps null: false
    end

    add_foreign_key :comments, :items
	add_foreign_key :comments, :users, column: :author_id
  end
end
