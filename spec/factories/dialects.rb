require 'faker'

FactoryBot.define do
  factory :dialect do
    name_en {"Hiroshima"}
    name_jp {"広島弁"}
    start_btn_text {"はじめるで"}
    next_btn_text {"次行くで"}
    complete_btn_text {"できたで"}
    description { Faker::Lorem.paragraph }
    area { 5 }
  end
end