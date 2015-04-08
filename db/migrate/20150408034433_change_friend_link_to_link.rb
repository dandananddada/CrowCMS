class ChangeFriendLinkToLink < ActiveRecord::Migration
  def change
  	rename_table :friend_links, :links
  end
end
