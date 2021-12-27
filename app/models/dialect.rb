class Dialect < ApplicationRecord
  has_many :grammars
  has_many :place_infos
  has_one_attached :default_image

  enum areas: { Hokkaido: 0, Tohoku: 1, Kanto: 2, Chubu:3, Kinki: 4, Chugoku: 5,Shikoku: 6, Kyushu: 7, Not_set: 8 }
end
