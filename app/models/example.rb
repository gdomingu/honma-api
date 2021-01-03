class Example < ApplicationRecord
  belongs_to :grammar
  has_one_attached :audio_clip
end
