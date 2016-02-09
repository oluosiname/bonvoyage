require "rails_helper"
RSpec.describe BookingsHelper, type: :helper do
  let(:flight) { create(:flight) }
  let(:booking) { build(:booking) }
  let(:passenger) { build(:passenger) }

  describe "#get_cost" do
    it "returns an integer" do
      booking.flight_id = flight.id
      booking.passengers << passenger
      expect(get_cost(booking)).to be_an Integer
    end
    it "returns an integer" do
      passenger.cabin = "First"
      booking.flight_id = flight.id
      booking.passengers << passenger
      expect(get_cost(booking)).to be_an Integer
    end
    it "returns an integer" do
      passenger.cabin = "Business"
      booking.flight_id = flight.id
      booking.passengers << passenger
      expect(get_cost(booking)).to be_an Integer
    end
  end
end
