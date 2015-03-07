class RenameArticleCategories < ActiveRecord::Migration
  def change
  	rename_table :article_categories, :categories
  end
end
