class ChangeMenusColumnsOrderToWeight < ActiveRecord::Migration
  def change
  	rename_column :menus, :order, :weight
  end
end
