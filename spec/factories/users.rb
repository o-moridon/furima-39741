FactoryBot.define do
  factory :user do
      transient do
        person { Gimei.name }
      end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "1a" + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name           { person.last.kanji }
    first_name            { person.first.kanji }
    family_name_kana      { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: Date.today) }

  end
end