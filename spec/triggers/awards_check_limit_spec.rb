require 'rails_helper'

RSpec.describe "Awards Check limit" do
  it "does not allow creating more than 3 awards for an event" do
    event = Event.create(name: "Test Event")

    Award.create(event: event)
    Award.create(event: event)
    Award.create(event: event)

    # Attempt to create a fourth award
    fourth_award = Award.new(event: event)

    # Use expect { ... }.to raise_error to test if ActiveRecord::StatementInvalid is raised
    expect { fourth_award.save }.to raise_error(ActiveRecord::StatementInvalid)

    # Verify that the fourth award was not created
    expect(Award.count).to eq(3)
  end
end
