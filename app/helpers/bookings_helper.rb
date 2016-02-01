module BookingsHelper
  def get_cost(booking)
    passengers = booking["passengers_attributes"]
    flight = Flight.find_by_id(booking["flight_id"])
    cost = 0
    passengers.each do |_key, value|
      cost += flight.economy if value["cabin"] == "Economy"
      cost += flight.first if value["cabin"] == "First"
      cost += flight.business if value["cabin"] == "Business"
    end
    cost
  end
end
