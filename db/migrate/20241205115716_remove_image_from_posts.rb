class RemoveImageFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :image, :string
  end
end