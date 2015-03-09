class CreateAdminArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author, default: '管理员'
      t.boolean :is_recommand, default: false
      t.boolean :is_carousel, default: false
      t.boolean :is_mark, default: false
      t.text :content
      t.string :abstract
      t.string :thumb_url
      t.string :file_url
      t.integer :hits, default: 0

      t.timestamps null: false
    end
  end
end
