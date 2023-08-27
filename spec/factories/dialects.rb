require 'faker'

FactoryBot.define do
  factory :dialect do
    trait :hiroshima do
      name_en {"Hiroshima"}
      name_jp {"広島弁"}
      start_btn_text {"はじめるで"}
      next_btn_text {"次行くで"}
      complete_btn_text {"できたで"}
      description { Faker::Lorem.paragraph }
      area { 5 }
    end

    trait :ehime do
      name_en {"Ehime"}
      name_jp {"愛媛弁"}
      start_btn_text {"はじめらい"}
      next_btn_text {"次行かい"}
      complete_btn_text {"できたよ"}
      description { Faker::Lorem.paragraph }
      area { 6 }
    end
  end
end