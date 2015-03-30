class CreateAdminMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :ancestry
      t.string :name
      t.string :url
    end
  end
end
