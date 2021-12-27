class Dialect < ApplicationRecord
  has_many :grammars
  has_many :place_infos
  has_one_attached :default_image

  enum status: [:hokkaido, :tohoku, :kanto, :chubu, :kinki, :chugoku, :shikoku, :kyushu, :not_set]
end
