class Tag < ApplicationRecord
    has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
    has_many :studies, through: :tag_maps #タグに関連したstudyを取得することができる
end
