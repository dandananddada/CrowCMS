class AddOptionsToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :options, :text, after: :is_mark
  end
end
