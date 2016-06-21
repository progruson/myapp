class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :new_id
      t.text :message

      t.timestamps null: false
    end
  end
end
