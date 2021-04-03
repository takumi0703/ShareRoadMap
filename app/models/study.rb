class Study < ApplicationRecord
    validates :content, presence: true
    validates :material, presence: true
    validates :period, presence: true
    validates :user_id, presence: true
end
