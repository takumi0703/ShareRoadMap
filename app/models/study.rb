# frozen_string_literal: true

class Study < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps#投稿に紐づけられたタグを取得することができる
  scope :order_asc, -> { order(id: :asc) }
  scope :order_desc, -> { order(id: :desc) }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  #編集する際に古いタグを削除する必要があるため、この処理が必要になる
  def save_studies(sent_tags)
    # 学習が投稿されたときにtag_nameが存在する場合、current_tagsに配列として全て代入される
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 投稿された時のタグを除いたタグをold_tagsとする
    old_tags = current_tags - sent_tags
    #現在存在するタグを除いた新しいタグをnew_tagsに代入
    new_tags = sent_tags - current_tags

      # 古いタグを削除
      old_tags.each do |old|
        self.tags.delete Tag.find_by(tag_name: old)
      end

      # 新しいタグをDBに保存
      new_tags.each do |new|
        new_study_tag = Tag.find_or_create_by(tag_name: new)
        # 配列に保存
        self.tags << new_study_tag
      end
  end
end
