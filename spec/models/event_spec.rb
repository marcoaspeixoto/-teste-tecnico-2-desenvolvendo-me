require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:event) { create(:event) }

  describe 'associations' do
    it { should have_many(:participations) }
    it { should have_many(:users).through(:participations) }
    it { should have_many(:awards) }
  end

  describe 'create' do
    it "creates a new event" do
      expect(event.name).to be_present
      expect(event.date).to be_present
    end
  end

  describe 'update' do
    it "updates the event's name" do
      new_name = Faker::Lorem.word

      event.update(name: new_name)
      expect(event.name).to eq(new_name)
    end
  end

  describe 'read' do
    it "reads the event's date" do
      read_date = Event.find(event.id).date

      expect(read_date).to eq(event.date)
    end
  end

  describe 'delete' do
    it "deletes the event" do
      expect {
        event.destroy
      }.to change(Event, :count).by(-1)
    end
  end
end
