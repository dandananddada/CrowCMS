class CreateAdminAlbumTags < ActiveRecord::Migration
  def change
    create_table :album_tags do |t|
      t.string :text
    end
  end
end
