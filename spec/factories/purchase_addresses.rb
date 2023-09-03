FactoryBot.define do
  factory :purchase_address do
    transient do
      address { Gimei.address }
    end
    token {"tok_abcdefghijk00000000000000000"}
    post_code     { '700-0001' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { address.city.kanji }
    street_number { Faker::Number.number(digits: rand(3..4)) }
    building_name { address.town.kanji + "ビル" }
    phone_number  { Faker::Number.leading_zero_number(digits: rand(10..11)) }
    association :user
    association :item

  end
end
