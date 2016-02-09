require "rails_helper"

RSpec.describe BookingsController do


  let(:flight) { create(:flight) }
  let(:user) { create(:user) }
  context "After successful payment" do
    it "updates booking payment status to true" do
      booking = create(:booking)
      user.email = "oluosiname@gmail.com"
      booking.user_id = user.id
      get :success, id: booking.id
       expect(booking.payment_status).to be true
      booking.destroy
    end
  end
end
