require "rails_helper"
describe "Booking", type: :feature do
  before(:all) do
    User.destroy_all
    Airport.destroy_all
    Flight.destroy_all
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
    it "Books a flight and allows user to edit for past booking" do
      visit login_path
      within(".signup-container") do
        fill_in "Email", with: @user.email
        fill_in "Password", with: @user.password
      end
      click_button "Sign In"
      visit all_flights_path
      first(".flight-detail").click_link("BOOK NOW")
      expect(page).to have_content "Passenger Details"
      fill_in "booking_passengers_attributes_0_name", with: "Kpeace"
      fill_in "booking_passengers_attributes_0_phone", with: "08037118709"
      click_button "Book"
      expect(page).to have_current_path(confirm_bookings_path)
      within(".dropdown-menu") do
        click_link "Past Bookings"
      end
      find(:xpath, "/html/body/div[3]/div[2]/div[9]/a").click
      fill_in "booking_passengers_attributes_0_name", with: "Sname"
      fill_in "booking_passengers_attributes_0_phone", with: "08087621887"
      click_button "Update"
      expect(page).to have_content "Booking Updated Successfully"
    end

    it "Books a flight and allows user to edit for past booking" do
      visit login_path
      within(".signup-container") do
        fill_in "Email", with: @user.email
        fill_in "Password", with: @user.password
      end
      click_button "Sign In"
      visit all_flights_path
      first(".flight-detail").click_link("BOOK NOW")
      expect(page).to have_content "Passenger Details"
      fill_in "booking_passengers_attributes_0_name", with: "Kpeace"
      fill_in "booking_passengers_attributes_0_phone", with: "08037118709"
      click_button "Book"
      expect(page).to have_current_path(confirm_bookings_path)
      within(".dropdown-menu") do
        click_link "Past Bookings"
      end
      find(:xpath, "/html/body/div[3]/div[2]/div[9]/a").click
      fill_in "booking_passengers_attributes_0_name", with: "Sname"
      fill_in "booking_passengers_attributes_0_phone", with: "08087621887"
      click_button "Update"
      expect(page).to have_content "Booking Updated Successfully"
    end

    it "Books a flight and allows user to edit for past booking" do
      visit login_path
      within(".signup-container") do
        fill_in "Email", with: @user.email
        fill_in "Password", with: @user.password
      end
      click_button "Sign In"
      visit all_flights_path
      first(".flight-detail").click_link("BOOK NOW")
      expect(page).to have_content "Passenger Details"
      fill_in "booking_passengers_attributes_0_name", with: "Kpeace"
      fill_in "booking_passengers_attributes_0_phone", with: "08037118709"
      click_button "Book"
      expect(page).to have_current_path(confirm_bookings_path)
      within(".dropdown-menu") do
        click_link "Past Bookings"
      end
      find(:xpath, "/html/body/div[3]/div[2]/div[8]/a").click
      expect(page).to have_content "Booking has Been Deleted"
    end
  end

  context "search for booking, manage bookings" do
    it "Books a flight and allows user to edit for past booking" do
      visit login_path
      within(".signup-container") do
        fill_in "Email", with: @user.email
        fill_in "Password", with: @user.password
      end
      click_button "Sign In"
      visit all_flights_path
      first(".flight-detail").click_link("BOOK NOW")
      expect(page).to have_content "Passenger Details"
      fill_in "booking_passengers_attributes_0_name", with: "Kpeace"
      fill_in "booking_passengers_attributes_0_phone", with: "08037118709"
      click_button "Book"
      expect(page).to have_current_path(confirm_bookings_path)
      within(".dropdown-menu") do
        click_link "Manage Bookings"
      end
      booking = Booking.last
      fill_in "ref", with: booking.ref
      within(".input-group") do
        click_button "Search"
      end
      expect(page).to have_current_path(search_bookings_path)
      expect(page).to have_content booking.ref
    end
  end
end
