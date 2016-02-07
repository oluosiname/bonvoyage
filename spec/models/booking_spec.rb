require "rails_helper"

RSpec.describe Booking, type: :model do
  before :all do
    User.destroy_all
    Booking.destroy_all
  end
  it "has a valid factory" do
    expect(build(:booking)).to be_valid
  end

  let(:booking) { build(:booking) }
  let(:flight) { build(:flight) }
  let(:passenger) { build(:passenger) }
  let(:user) { build(:user) }

  before do
    user.save
    flight.save
    booking.flight_id = flight.id
    booking.user_id = user.id
    booking.save
    passenger.booking_id = booking.id
    passenger.cost = flight.economy
    passenger.save
  end

  describe "instance methods" do
    context "respond to instance method calls" do
      it { expect(booking).to respond_to(:flight_id) }
      it { expect(booking).to respond_to(:user_id) }
      it { expect(booking).to respond_to(:ref) }
      it { expect(booking).to respond_to(:payment_status) }
    end
  end

  describe "class methods" do
    context "respond to class method calls" do
      it { expect(Booking).to respond_to(:by_user) }
    end
  end
end
