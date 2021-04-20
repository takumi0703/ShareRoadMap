# frozen_string_literal: true

class Study < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
end
