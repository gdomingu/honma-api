class Quiz < ApplicationRecord
  belongs_to :grammar
  has_many :quiz_completions
end
