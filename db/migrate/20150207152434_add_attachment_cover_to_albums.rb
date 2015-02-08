class AddAttachmentCoverToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :albums, :cover
  end
end
