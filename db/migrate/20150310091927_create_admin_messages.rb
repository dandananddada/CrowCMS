class CreateAdminMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :author
      t.string :email
      t.boolean :is_permit, default: false
      t.text :content
      t.text :reply

      t.timestamps null: false
    end
  end
end
