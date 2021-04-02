class Road < ApplicationRecord
    validates :goal, presence: true
    validates :user_id, presence: true
end
