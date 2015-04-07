class AddOrderAndVisibleToMenus < ActiveRecord::Migration
  def change
  	add_column :menus, :order, :integer, default: '0'
  	add_column :menus, :visible, :boolean, default: true
  end
end
