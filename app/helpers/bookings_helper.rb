module BookingsHelper
  def get_cost(booking)
    passengers = booking.passengers
    flight = booking.flight
    cost = 0
    passengers.each do |passenger|
      cost += flight.economy if passenger.cabin == "Economy"
      cost += flight.first if passenger.cabin == "First"
      cost += flight.business if passenger.cabin == "Business"
    end

    passengers.each_with_index do |passenger|
      passenger.cost = flight.economy if passenger.cabin == "Economy"
      passenger.cost = flight.first if passenger.cabin == "First"
      passenger.cost = flight.business if passenger.cabin == "Business"
    end
    cost
  end

  def payment_url(booking)
    values = {
      business: "oluosiname-facilitator@yahoo.com",
      cmd: "_cart",
      upload: 1,
      return:  success_bookings_url(:id => booking.id),
      invoice: booking.ref
    }

    booking.passengers.each_with_index do |passenger, index|
      values.merge!(
        "amount_#{index + 1}" => passenger.cost,
        "item_name_#{index + 1}" => passenger.first_name
      )
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
