class FlightsController < ApplicationController
  def search
  end

  def result
    @seats = params[:seats]
    @flights = Flight.where("departure_id = ? AND departure_date = ? AND arrival_id = ?", params[:departure_id], params[:date], params[:arrival_id])
    redirect_to root_path unless @flights.length > 0
    flash[:notice] = "No Flights Available"

  end

  def all
    @current_page = params[:page].to_i
    @pages = Flight.all.length / 10
    @flights = Flight.offset(10 * (params[:page].to_i - 1)).
               limit(10).order("departure_date ASC")
  end
end
