class CreateAdminMenus < ActiveRecord::Migration
  def change
    create_table :admin_menus do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
