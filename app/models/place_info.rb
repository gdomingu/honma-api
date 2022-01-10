class PlaceInfo < ApplicationRecord
  belongs_to :dialect
  has_many_attached :images

  validates :description, :presence => true, :length => { maximum: 280 } 
end
