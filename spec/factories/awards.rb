FactoryBot.define do
  factory :award do
    event_id { FactoryBot.create(:event).id }
    description { Faker::Lorem.sentence }
  end
end

