class ChangeAgeGroupToIntegerInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :age_group, :integer, null: false
  end
end
