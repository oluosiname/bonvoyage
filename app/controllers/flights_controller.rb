class FlightsController < ApplicationController
  def search
    @airport = Airport.all.order("name ASC")
  end

  def all
    @flights = Flight.all.order("departure_date ASC")
  end
end
