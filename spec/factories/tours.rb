FactoryBot.define do
  factory :tour do
    name { Faker::Lorem.word }
    location { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.number(10) }
  end
end
