FactoryBot.define do
  factory :participation do
    user_id { FactoryBot.create(:user).id }
    event_id { FactoryBot.create(:event).id }
    award_id { FactoryBot.create(:award).id }
  end
end