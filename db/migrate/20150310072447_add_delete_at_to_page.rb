class AddDeleteAtToPage < ActiveRecord::Migration
  def change
  	  add_column :pages, :deleted_at, :datetime, after: :updated_at
    add_index :pages, :deleted_at
  end
end
