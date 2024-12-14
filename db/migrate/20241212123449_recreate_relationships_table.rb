class RecreateRelationshipsTable < ActiveRecord::Migration[7.1] 
  def up
    # 古いテーブルを削除
    # drop_table :relationships, if_exists: true

    # 新しいテーブルを作成
    # create_table :relationships do |t|
    #   t.references :follower, null: false, foreign_key: { to_table: :users }
    #   t.references :followed, null: false, foreign_key: { to_table: :users }
    #   t.timestamps
    # end
  end

  def down
    # テーブルを元に戻す処理は削除
    # (既に削除されているためコメントアウトの必要なし)
  end
end