require "rails_helper"
describe "Flight", type: :feature do
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
  end

  before(:each) do
    Seed.airports
    Seed.flights
  end

  context "All flights" do
    it "displays all flights" do
      visit all_flights_path
      expect(page).to have_content Flight.first.departure.name
    end
  end
end
