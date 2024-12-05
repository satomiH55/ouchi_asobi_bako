class RemoveColumnsFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :user_id, :integer
    remove_column :posts, :category_id, :integer
    remove_column :posts, :views_count, :integer
    remove_column :posts, :favorites_count, :integer
    remove_column :posts, :status, :integer
  end
end
