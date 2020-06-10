class Objective < ApplicationRecord
    acts_as_taggable
    # モデルの関連付け
    belongs_to :user, optional: true
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    # バリデーションの設定
    validates :title, presence: true
    validates :explain, presence: true
    validates :tag_list, presence: true

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end
