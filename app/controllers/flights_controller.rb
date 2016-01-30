class FlightsController < ApplicationController
  def search
    @airport = Airport.all.order("name ASC")
  end

  def all
    @current_page = params[:page].to_i
    @pages = Flight.all.length / 10
    @flights = Flight.offset(10 * (params[:page].to_i - 1)).
                      limit(10).order("departure_date ASC")
  end
end
