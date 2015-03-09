class AddIsOptionAndOptionIdsToCategory < ActiveRecord::Migration
  def change
  	add_column :categories, :is_option, :boolean, defaule: false, after: :is_carousel
  	add_column :categories, :option_ids, :string, after: :is_option
  end
end
