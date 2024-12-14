class Post < ApplicationRecord
    attachment :image
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    validates :title, presence: true, length: { maximum: 20 }
    validates :age_group, presence: true, length: { maximum: 20 }
    validates :tool, presence: true, length: { maximum: 20 }
    validates :step, presence: true, length: { maximum: 195 }
    validates :image_id, presence: true

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
end
