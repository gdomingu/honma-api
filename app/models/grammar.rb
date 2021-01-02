class Grammar < ApplicationRecord
  belongs_to :dialect
  has_many :examples
end
