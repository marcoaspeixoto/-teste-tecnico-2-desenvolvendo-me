require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:participations) }
  it { should have_many(:events).through(:participations) }

  it "creates a new user" do
    user = create(:user)
    expect(user.name).to be_present
    expect(user.email).to be_present
  end
end
