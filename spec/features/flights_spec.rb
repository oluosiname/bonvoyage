require "rails_helper"
describe "Flight", type: :feature do
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
  end

  before(:each) do
    Seed.airports
    Seed.flights
  end
  context "Search Flight" do
    it "Search for flight that doesnt exist " do
      visit "/"
      select "N'djili Airport Kinshasa, Congo", from: "departure_id"
      select Airport.last.name, from: "arrival_id"
      fill_in("departure_date", with: "1990 - 11 - 1")
      select 1, from: "seats"
      click_button "Search"
      expect(page).to have_content "No Flights Available For That Search"
    end

    it "Search for flight without date " do
      visit "/"
      select Airport.last.name, from: "departure_id"
      select "Julius Nyerere International Airport Dar es Salam, Tanzania", from: "arrival_id"
      select 1, from: "seats"
      click_button "Search"
      expect(page).to have_content "Julius Nyerere International Airport Dar es Salam, Tanzania"
    end
  end

  context "All flights" do
    it "displays all flights" do
      visit all_flights_path
      expect(page).to have_content "12hrs"
      expect(page).to have_content "N'djili Airport Kinshasa"
      expect(page).to have_content "Julius Nyerere International Airport"
    end
  end
end
