FactoryBot.define do
  factory :event do
    name { Faker::Lorem.word }
    date { Faker::Date.between(from: 2.days.ago, to: 2.days.from_now) }
  end
end
