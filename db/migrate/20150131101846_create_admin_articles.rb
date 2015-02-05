class CreateAdminArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.belongs_to :article_category, index: true
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
    add_foreign_key :articles, :article_categories
  end
end
