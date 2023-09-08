require 'rails_helper'

RSpec.describe Award, type: :model do
  describe 'associations' do
    it { should belong_to(:event) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
  end

  describe 'create' do
    let!(:event) { create(:event) }

    it 'creates a new award' do
      award = create(:award, event: event)
      expect(award).to be_valid
    end
  end

  describe 'update' do
    let!(:event) { create(:event) }
    let!(:award) { create(:award, event: event) }

    it "updates the award's description" do
      new_description = Faker::Lorem.sentence

      award.update(description: new_description)
      expect(award.description).to eq(new_description)
    end
  end

  describe 'read' do
    let!(:event) { create(:event) }
    let!(:award) { create(:award, event: event) }

    it "reads the award's description" do
      read_description = Award.find(award.id).description
      expect(read_description).to eq(award.description)
    end
  end

  describe 'delete' do
    let!(:event) { create(:event) }
    let!(:award) { create(:award, event: event) }

    it "deletes the award" do
      expect {
        award.destroy
      }.to change(Award, :count).by(-1)
    end
  end
end
