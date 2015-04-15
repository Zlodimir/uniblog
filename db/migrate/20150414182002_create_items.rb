class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.references :author, index: true

      t.timestamps null: false
    end

    add_foreign_key :items, :users, column: :author_id
  end
end
