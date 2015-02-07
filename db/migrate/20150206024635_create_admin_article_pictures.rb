class CreateAdminArticlePictures < ActiveRecord::Migration
  def change
    create_table :article_pictures do |t|
      t.belongs_to :article, index: true
    end
    add_foreign_key :article_pictures, :articles
  end
end
