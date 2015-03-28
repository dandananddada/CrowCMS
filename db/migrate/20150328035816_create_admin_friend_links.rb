class CreateAdminFriendLinks < ActiveRecord::Migration
  def change
    create_table :friend_links do |t|
      t.string :name
      t.string :url
      t.attachment :logo

    end
  end
end
