class Seed
  def self.airports
    airports = [
      { name: "N'djili Airport", location: "Congo" },
      { name: "Leon M'ba Airport", location: "Gabon"
        },
      { name: "Kigali Airport", location: "Rwanda" }

    ]
    @airlines = ["Dana Air", "Sosoliso", "Bell View", "Kenya Airways",
                 "Arik Air", "Virgin Atlantic", "Sname Air"]
    airports.each do |airport|
      Airport.create(airport)
    end
  end

  def self.flights
    10.times do
      airports = Airport.order("RANDOM()")
      flight = Flight.new
      flight.duration = 12
      flight.airline = @airlines.sample
      flight.departure_id = airports.first.id
      flight.arrival_id = airports.last.id
      flight.departure_date = Time.now.advance(
        days: rand(3..20), hours: rand(1..9), minutes: rand(0..60))
      flight.departure_time = flight.departure_date.strftime("%I:%M %p")
      flight.economy = rand(10..50) * 1000
      flight.business = rand(51..100) * 1000
      flight.first =  rand(101..200) * 1000
      flight.save!
    end
  end
end
