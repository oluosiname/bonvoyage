class BookingsController < ApplicationController
  include BookingsHelper
  def make_new
    @flight = Flight.find_by_id(params[:flight])
    @seats = params[:passengers]
    @booking = Booking.new
    @user = session[:user_id]
    @seats.to_i.times { @booking.passengers.build }
  end

  def make
    session[:booking] = bookings_params
    redirect_to confirm_bookings_path
  end

  def confirm
    @current_booking = session[:booking]
    @passengers = @current_booking["passengers_attributes"]
    @current_booking["cost"] = get_cost(@current_booking)
    @flight = Flight.find_by_id(@current_booking["flight_id"])
    @seats = @current_booking["seats"]
  end

  def add
    @booking = Booking.new(session[:booking])
    @booking.save
    redirect_to root_path
  end

  def bookings_params
    params.require(:booking).permit(:ref, :seats, :flight_id, :user_id, :cost,
                                    :payment_status, passengers_attributes:
                                    [:first_name, :last_name, :email, :phone,
                                      :cabin])
  end
end
