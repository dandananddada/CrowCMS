class CreateAdminArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :ancestry
      t.string :title
      t.boolean :is_article, default: true
      t.boolean :is_thumb, default: false
      t.boolean :is_file, default: false
      t.boolean :is_abstract, default: false
      t.boolean :is_carousel, default: false

      t.timestamps null: false
    end
  end
end
