class PlaceInfo < ApplicationRecord
  belongs_to :dialect
  has_many_attached :images 

  validates :description, :presence => true, :length => { maximum: 280 }
  validates :images, attached_file_number: { maximum: 3 }
end
