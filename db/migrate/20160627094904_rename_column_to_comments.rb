class RenameColumnToComments < ActiveRecord::Migration
  def change
    rename_column :comments, :new_id, :article_id
  end
end
