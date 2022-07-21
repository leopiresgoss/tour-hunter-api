FactoryBot.define do
  factory :user do
    full_name { Faker::Lorem.word }
    role { Faker::Lorem.word }
    email { Faker::Lorem.paragraph }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.today }
  end
end
