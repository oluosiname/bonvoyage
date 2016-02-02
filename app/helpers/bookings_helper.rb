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
      return:  success_bookings_url(id: booking.id),
      invoice: booking.ref
    }

    booking.passengers.each_with_index do |passenger, index|
      values["amount_#{index + 1}"] = convert passenger.cost
      values["item_name_#{index + 1}"] = passenger.first_name
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  def convert(naira_cost)
    response = RestClient.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDNGN%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
    ")
    result = JSON.parse(response)
    exchange_rate = result["query"]["results"]["rate"]["Rate"]
    (naira_cost / exchange_rate.to_f).round(2)
  end
end
