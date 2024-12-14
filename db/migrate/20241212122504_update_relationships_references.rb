class UpdateRelationshipsReferences < ActiveRecord::Migration[7.1]
  def change
    # 既存の参照を削除する
    # remove_reference :relationships, :follower, foreign_key: true
    # remove_reference :relationships, :followed, foreign_key: true

    # 新しい参照を追加する
    # add_reference :relationships, :follower, null: false, foreign_key: { to_table: :users }
    # add_reference :relationships, :followed, null: false, foreign_key: { to_table: :users }
  end
end
