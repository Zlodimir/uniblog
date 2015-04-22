class RenameOrderInPages < ActiveRecord::Migration
  def change
  	rename_column :pages, :order, :sort
  end
end
