class CreateAdminProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.string :text, unique: true
    end
  end
end
