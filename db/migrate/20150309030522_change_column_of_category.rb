class ChangeColumnOfCategory < ActiveRecord::Migration
  def change
  	rename_column :categories, :option_ids, :option_keys
  end
end
