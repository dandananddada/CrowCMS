class CreateAdminPages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :abstract
      t.text :content, unique: true

      t.timestamps null: false
    end
  end
end
