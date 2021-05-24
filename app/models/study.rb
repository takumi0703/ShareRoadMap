# frozen_string_literal: true

class Study < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  scope :order_asc, -> { order(id: :asc) }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
