require 'faker'

FactoryBot.define do
  factory :grammar do
    description { Faker::Lorem.sentence }
    dialect_id { Dialect.first.id }
  end
end