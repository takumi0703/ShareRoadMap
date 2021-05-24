# frozen_string_literal: true

class Study < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps#投稿に紐づけられたタグを取得することができる
  scope :order_asc, -> { order(id: :asc) }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
