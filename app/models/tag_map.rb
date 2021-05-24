class TagMap < ApplicationRecord
  belongs_to :study
  belongs_to :tag

  validates :study_id, presence: true
  validates :tag_id, presence: true
end
