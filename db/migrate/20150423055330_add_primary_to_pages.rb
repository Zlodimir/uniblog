class AddPrimaryToPages < ActiveRecord::Migration
  def change
    add_column :pages, :primary, :boolean, default: false
  end
end
