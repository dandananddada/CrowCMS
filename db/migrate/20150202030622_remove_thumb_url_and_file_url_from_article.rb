class RemoveThumbUrlAndFileUrlFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :thumb_url, :string
    remove_column :articles, :file_url, :string
  end
end
