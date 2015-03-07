class ChangeArticle < ActiveRecord::Migration
  def change
  	remove_foreign_key :articles, :article_category_id
  	add_column :articles, :category_id, :integer
  	add_foreign_key :articles, :categories
  end
end
