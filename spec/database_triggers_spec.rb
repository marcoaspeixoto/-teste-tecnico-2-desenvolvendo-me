require 'rails_helper'

RSpec.describe "Database Triggers" do
  describe "awards_check_limit trigger" do
    let(:event) { create(:event) } # Assuming you have a Factory for events

    it "does not allow creating more than 3 awards for an event" do
      # Create 3 awards for the same event
      Award.create!(event: event)
      Award.create!(event: event)
      Award.create!(event: event)

      # Try to insert a fourth award, which should not be successful
      fourth_award = Award.new(event: event)
      fourth_award.save

      expect(fourth_award.errors.full_messages).to include("O evento ja atingiu o limite maximo de premios (3)")
    end
  end
end
