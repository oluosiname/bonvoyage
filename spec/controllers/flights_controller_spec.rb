require "rails_helper"
RSpec.describe FlightsController do
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
  end

  before(:each) do
    Seed.airports
    Seed.flights
  end

  context "Search Flight with date" do
    it "returns flight if it exists" do
      departure = Flight.last.departure_id
      arrival = Flight.last.arrival_id
      date =  Flight.last.departure_date
      post :result, departure_id: departure, arrival_id: arrival, date: date
      expect(response).to render_template "result"
      expect(assigns(:flights).empty?).to be false
    end

    it "returns error for flight that doesnt exist " do
      departure = Flight.last.departure_id
      arrival = Flight.last.arrival_id
      date = Time.now.advance(days: 100)
      post :result, departure_id: departure, arrival_id: arrival, date: date
      expect(assigns(:flights).empty?).to be true
      expect(flash["notice"]).to include "No Flights Available For That Search"
    end
  end

  context "Search Flight without date" do
    it "returns flight if it exists" do
      departure = Flight.last.departure_id
      arrival = Flight.last.arrival_id
      post :result, departure_id: departure, arrival_id: arrival, date: ""
      expect(response).to render_template "result"
      expect(assigns(:flights).empty?).to be false
    end

    it "returns error for flight that doesnt exist " do
      departure = Flight.last.departure_id
      arrival = 0
      post :result, departure_id: departure, arrival_id: arrival, date: ""
      expect(assigns(:flights).empty?).to be true
      expect(flash["notice"]).to include "No Flights Available For That Search"
    end
  end
end
