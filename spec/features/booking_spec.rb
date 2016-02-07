require "rails_helper"
describe "Booking", type: :feature do
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
  end

  before(:each) do
    Seed.airports
    Seed.flights
    Seed.bookings
  end

  context "Book Flight" do
    it "Books a flight " do
      visit all_flights_path
      find(:xpath, "/html/body/div[2]/div[2]/div[6]/a").click
      expect(page).to have_content "Passenger Details"
      fill_in "Name", with: "Kpeace"
      fill_in "Phone", with: "08037118709"
      click_button "Book"
      expect(page).to have_current_path(confirm_bookings_path)
    end
  end
end

