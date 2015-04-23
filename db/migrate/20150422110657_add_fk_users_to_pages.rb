class AddFkUsersToPages < ActiveRecord::Migration
  def change
  	add_foreign_key :pages, :users, column: :author_id
  end
end
