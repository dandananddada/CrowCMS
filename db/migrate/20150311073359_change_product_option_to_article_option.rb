class ChangeProductOptionToArticleOption < ActiveRecord::Migration
  def change
  	rename_table :product_options, :article_options
  end
end
