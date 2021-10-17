class Dialect < ApplicationRecord
  has_many :grammars
  has_many :place_infos
end
