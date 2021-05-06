class Comment < ApplicationRecord
  validates :comment_content, presence: true,length: { maximum: 140 }

  belongs_to :user
  belongs_to :study
end
