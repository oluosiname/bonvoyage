class BookingsController < ApplicationController
  include BookingsHelper
  def new
    @flight = Flight.find_by_id(params[:flight])
    @seats = params[:passengers]
    @booking = Booking.new
    @user = session[:user_id]
    @seats.to_i.times { @booking.passengers.build }
  end

  def create
    booking = Booking.new(bookings_params)
    booking.cost = get_cost(booking)
    booking.save
    session[:booking] = booking.id
    redirect_to confirm_bookings_path
  end

  def index
    @bookings = Booking.by_user(session[:user_id])
  end

  def edit
  end

  def destroy
    Booking.find(params[:id]).destroy
    flash[:success] = "Your Booking has Been Deleted"
    redirect_to bookings_path
  end

  def confirm
    @booking = Booking.find_by_id(session[:booking])
    @passengers = @booking.passengers
    @flight = @booking.flight
    @seats =  @booking.seats
  end

  def success
    @booking = Booking.find_by_id(params[:id])
    BookingMailer.successful(@booking, "Booking Successful").deliver_now
    @booking.update_attributes payment_status: true
  end

  def bookings_params
    params.require(:booking).permit(:ref, :seats, :flight_id, :user_id, :cost,
                                    :anon_email, :payment_status,
                                    passengers_attributes: [:first_name,
                                                            :last_name, :email,
                                                            :phone, :cabin])
  end
end
