class AddAttachmentPictureToArticlePictures < ActiveRecord::Migration
  def self.up
    change_table :article_pictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :article_pictures, :picture
  end
end
