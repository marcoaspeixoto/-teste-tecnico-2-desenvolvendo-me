require 'rails_helper'

RSpec.describe "Database Triggers" do
  it "does not allow creating more than 3 awards for an event" do
    event = Event.create(name: "Test Event")

    Award.create(event: event)
    Award.create(event: event)
    Award.create(event: event)

    # Attempt to create a fourth award
    fourth_award = Award.new(event: event)
    fourth_award.save

    # Verify that the fourth award was not created
    expect(Award.count).to eq(3)
  end
end
