class CreateAdminBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.text :description
      t.string :url
      t.attachment :banner

      t.timestamps null: false
    end
  end
end
