require 'rails_helper'

RSpec.describe "Awards Check limit" do
  it "does not allow creating more than 3 awards for an event" do
    event = create(:event)

    # creates 3 awards for the same event
    Award.create(event: event)
    Award.create(event: event)
    Award.create(event: event)

    # Attempt to create a fourth award
    fourth_award = Award.new(event: event)

    # Using expect { ... }.to raise_error to test if ActiveRecord::StatementInvalid was raised
    expect { fourth_award.save }.to raise_error(ActiveRecord::StatementInvalid)

    # Check if the fourth award has not been created
    expect(Award.count).to eq(3)
  end
end
