require "rails_helper"
RSpec.describe BookingsController do
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
  end

  before(:each) do
    Seed.airports
    Seed.flights
  end
  context "After successful payment" do
    it "updates booking payment status to true" do
      user = create(:user)
      booking = create(:booking)
      user.email = "oluosiname@gmail.com"
      booking.user_id = user.id
      booking.flight = Flight.last
      booking.save!
      get :success, id: booking.id
      expect(booking.payment_status).to be true
      booking.destroy
    end
  end
end
