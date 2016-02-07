require "rails_helper"
describe "Booking", type: :feature do
  before(:all) do
    User.destroy_all
    @user = create(:user)
  end

  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
  end

  before(:each) do
    Seed.airports
    Seed.flights
  end

  context "Book Flight" do
    it "Books a flight " do
      visit login_path
      within(".signup-container") do
        fill_in "Email", with: @user.email
        fill_in "Password", with: @user.password
      end
      click_button "Sign In"
      visit all_flights_path
      find(:xpath, "/html/body/div[2]/div[2]/div[6]/a").click
      expect(page).to have_content "Passenger Details"
      fill_in "booking_passengers_attributes_0_name", with: "Kpeace"
      fill_in "booking_passengers_attributes_0_phone", with: "08037118709"
      click_button "Book"
      expect(page).to have_current_path(confirm_bookings_path)
      within(".dropdown-menu") do
        click_link "Past Bookings"
      end
      find(:xpath, "/html/body/div[2]/div[2]/div[8]/a").click
      expect(page).to have_content "Your Booking has Been Deleted"
    end
  end
end
