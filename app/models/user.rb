# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, uniqueness: true
  validates :email,
            presence: true,
            format: {
              with: VALID_EMAIL_REGEX
            },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :creat

  mount_uploader :image_icon, ImageUploader
end
