class PlaceInfo < ApplicationRecord
  belongs_to :dialect
  has_many_attached :images
end
