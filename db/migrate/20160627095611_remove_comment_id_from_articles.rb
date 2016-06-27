class RemoveCommentIdFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :comment_id, :integer
  end
end
