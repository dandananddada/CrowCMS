class AddDeletedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :deleted_at, :datetime, after: :updated_at
    add_index :articles, :deleted_at
  end
end
