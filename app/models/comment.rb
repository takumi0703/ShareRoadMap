class Comment < ApplicationRecord
  validates :comment_content, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :study
end
