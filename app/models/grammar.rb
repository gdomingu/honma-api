class Grammar < ApplicationRecord
  belongs_to :dialect
  has_many :examples
  has_many :quizzes
end
