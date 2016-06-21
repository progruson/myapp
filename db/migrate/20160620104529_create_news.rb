class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string    :title
      t.text      :content
      t.integer   :category_id
      t.string    :source_link
      t.string    :image_src
      t.integer   :comment_id

      t.timestamps null: false
    end
  end
end
