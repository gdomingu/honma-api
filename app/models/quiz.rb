class Quiz < ApplicationRecord
  belongs_to :grammar
  has_many :quiz_completions

  validates :tokyo, presence: true
  validates :answer, presence: true
end
