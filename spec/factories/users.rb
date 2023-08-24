FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {Faker::Name.last_name}
    first_name_kana       {Faker::Name.first_name}
    birthday              {Faker::Date.between(from: '1930-01-01', to: Date.today)}

  end
end