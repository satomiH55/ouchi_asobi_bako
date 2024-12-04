class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :title, null: false
      t.string :age_group, null: false
      t.text :tool, null: false
      t.text :step, null: false
      t.string :image, null: false
      t.integer :views_count, default: 0
      t.integer :favorites_count, default: 0
      t.integer :status, null: false, default: 0 # 0:投稿する, 1:下書き保存する

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' } # 自動的に作成・更新日時を設定
    end
  end
end