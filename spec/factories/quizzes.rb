require 'faker'

FactoryBot.define do
  factory :quiz do
    tokyo { Faker::Lorem.sentence }
    answer { Faker::Lorem.sentence }
    grammar_id { Grammar.first.id }
  end
end