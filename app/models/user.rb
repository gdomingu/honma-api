class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :quiz_completions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
