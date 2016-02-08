class FlightsController < ApplicationController
  def result
    @seats = params[:seats]
    if params[:date] == ""
      @flights = Flight.by_route(
        params[:departure_id], params[:arrival_id]).available
    else
      @flights = Flight.by_route(
        params[:departure_id], params[:arrival_id]).by_date(params[:date])
    end
    flash[:notice] = "No Flights Available For That Search"
    redirect_to root_path if @flights.length < 1
  end

  def all
    @current_page = params[:page].to_i
    @pages = Flight.all.length / 10
    @flights = Flight.offset(10 * (params[:page].to_i - 1)).
               limit(10).order("departure_date ASC")
  end

  def search
  end
end
