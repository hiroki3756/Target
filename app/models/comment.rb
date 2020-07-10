class Comment < ApplicationRecord
    # モデルの関連付け
    belongs_to :user
    belongs_to :objective

    # バリデーションの設定
    validates :comment, presence: true
end
