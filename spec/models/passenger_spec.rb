require "rails_helper"

RSpec.describe Passenger, type: :model do
  it "has a valid factory" do
    expect(build(:passenger)).to be_valid
  end

  let(:passenger) { build(:passenger) }
  let(:flight) { build(:flight) }

  before do
    passenger.cost = flight.economy
  end

  describe "instance methods" do
    context "respond to instance method calls" do
      it { expect(passenger).to respond_to(:booking_id) }
      it { expect(passenger).to respond_to(:name) }
      it { expect(passenger).to respond_to(:phone) }
      it { expect(passenger).to respond_to(:cabin) }
      it { expect(passenger).to respond_to(:cost) }
    end
  end

  describe "ActiveModel Association" do
    it { expect(passenger).to belong_to(:booking) }
  end
end
