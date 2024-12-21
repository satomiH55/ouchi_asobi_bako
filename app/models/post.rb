class Post < ApplicationRecord
    attachment :image
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    validates :title, presence: true, length: { maximum: 20 }
    validates :age_group, presence: true, length: { maximum: 20 },
                       numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
    validates :tool, presence: true, length: { maximum: 20 }
    validates :step, presence: true, length: { maximum: 195 }
    validates :image, presence: true # もしこのバリデーションがある場合、画像を選択しないとエラーになります

    enum status: { published: 0, draft: 1 }

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
     # 検索スコープの定義
    scope :search_by_keyword, ->(keyword) {
    where("title LIKE :query OR age_group LIKE :query OR tool LIKE :query OR step LIKE :query", query: "%#{keyword}%")
    }
end
