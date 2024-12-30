class ChangeCategoryIdNotNullOnPosts < ActiveRecord::Migration[7.1]
  def up
    Post.where(category_id: nil).update_all(category_id: 1) # 仮に1をデフォルト値とする場合
    change_column_null :posts, :category_id, false
  end

  def down
    change_column_null :posts, :category_id, true
  end
end
