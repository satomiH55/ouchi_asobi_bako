class RemoveForeignKeysFromRelationships < ActiveRecord::Migration[7.1]
  def change
    # 外部キー制約の削除
    # remove_foreign_key :relationships, column: :followed_id
    # remove_foreign_key :relationships, column: :follower_id
  end
end