class Seed
  def self.airports
    airports = [
      { name: "N'djili Airport", location: "Kinshasa, Congo" },
      { name: "Leon M'ba International Airport", location: "Libraville, Gabon" },
      { name: "Kigali International Airport", location: "Kigali, Rwanda" },
      { name: "Julius Nyerere International Airport",
        location: "Dar es Salam, Tanzania" },
      { name: "Addis Ababa Bole International Airport",
        location: "Addis Ababa, Ethiopia" }
    ]
    @airlines = ["Dana Air", "Sosoliso", "Bell View", "Kenya Airways", "Arik Air",
                "Virgin Atlantic", "Sname Air"]
    airports.each do |airport|
      Airport.create(airport)
    end
  end

  def self.flights
    10.times do
      id = [1,2,3].sample
      arr_id = [4,5].sample
      flight = Flight.new
      flight.duration = 12
      flight.airline = @airlines.sample
      flight.departure_id = id
      flight.arrival_id  = arr_id
      flight.departure_date = Time.now.advance(
                            days: rand(0..20), hours: rand(1..9), minutes: rand(0..60))
      flight.departure_time = flight.departure_date.strftime("%I:%M %p")
      flight.economy = rand(10..50) * 1000
      flight.business = rand(51..100) * 1000
      flight.first =  rand(101..200) * 1000
      flight.save!
    end
  end

  def self.bookings
    5.times do
      booking = Booking.new
      booking.flight_id = 1
      booking.user_id = 1
      booking.seats = 2
      booking.save
    end
  end
end
