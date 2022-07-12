FactoryBot.define do
  factory :tour_date do
    date { Faker::Date.in_date_period }
    tour_id nil
  end
end
