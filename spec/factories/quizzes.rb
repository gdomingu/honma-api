require 'faker'

FactoryBot.define do
  factory :quiz do
    tokyo { Faker::Lorem.sentence }
    answer { Faker::Lorem.sentence }

    association :grammar, factory: :grammar
  end
end