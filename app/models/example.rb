class Example < ApplicationRecord
  belongs_to :grammar
  has_one_attached :audio_clip
  validates :language, presence: true
  validates :sentence1, presence: true
  validates :sentence2, presence: true
end