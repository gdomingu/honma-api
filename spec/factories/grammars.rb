require 'faker'

FactoryBot.define do
  factory :grammar do
    description { Faker::Lorem.sentence }

    association :dialect, factory: :dialect
  end
end