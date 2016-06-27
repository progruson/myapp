class AddTextPreviewToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :text_preview, :text
  end
end
