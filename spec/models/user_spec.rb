require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'associations' do
    it { should have_many(:participations) }
    it { should have_many(:events).through(:participations) }
  end

  describe 'create' do
    it "creates a new user" do
      expect(user.name).to be_present
      expect(user.email).to be_present
    end
  end

  describe 'update' do
    it "updates the user's name" do
      new_name = Faker::Name.name

      user.update(name: new_name)
      expect(user.name).to eq(new_name)
    end
  end

  describe 'read' do
    it "reads the user's email" do
      read_email = User.find(user.id).email

      expect(read_email).to eq(user.email)
    end
  end

  describe 'delete' do
    it "deletes the user" do
      expect {
        user.destroy
      }.to change(User, :count).by(-1)
    end
  end
end
