class ChangeArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :category_id, :integer, after: :id
  	add_foreign_key :articles, :categories
  end
end
