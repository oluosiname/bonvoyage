 arequire "faker"

Airport.destroy_all
Flight.destroy_all

airports_list = [
  { name: "N'djili Airport", location: "Kinshasa, Congo" },
  { name: "Leon M'ba International Airport", location: "Libraville, Gabon" },
  { name: "Kigali International Airport", location: "Kigali, Rwanda" },
  { name: "Julius Nyerere International Airport",
    location: "Dar es Salam, Tanzania" },
  { name: "Addis Ababa Bole International Airport",
    location: "Addis Ababa, Ethiopia" },
  { name: "Cairo International Airport", location: "Cairo, Egypt" },
  { name: "Tripoli International Airport", location: "Tripoli, Libya" },
  { name: "Mohammed V International Airport",
    location: "Casablanca, Morrocco" },
  { name: "Khartoum International Airport", location: "Khartoum, Sudan" },
  { name: "Carthage International Airport", location: "Tunis, Tunisia" },
  { name: "Quatro de Fevereiro Airport", location: "Luanda, Angola" },
  { name: "Simon Mwansa Kapwepwe Airport", location: "Ndola, Zambia" },
  { name: "Cape Town International Airport",
    location: "Cape Town, South Africa" },
  { name: "Lanseria International Airport",
    location: "Johannesburg, South Africa" },
  { name: "Harare International Airport", location: "Harare, Zimbabwe" },
  { name: "Douala Airport", location: "Doula, Cameroon" },
  { name: "Port Bouet Airport", location: "Abidjan, Ivory Coast" },
  { name: "Kotoka International Airport", location: "Accra, Ghana" },
  { name: "Nnamdi Azikiwe International Airport", location: "Abuja, Nigeria" },
  { name: "Murtala Mohammed International Airport", location: "Lagos, Nigeria" }
]

airports_id = []
airlines = ["Dana Air", "Sosoliso", "Bell View", "Kenya Airways", "Arik Air",
            "Virgin Atlantic", "Sname Air", "Ethiopia Airlines",
            "British Airways", "South African Express", "Egypt Air"]

airports_list.each { |airport| airports_id << Airport.create(airport).id }

def set_time
  departure_date = Time.now.advance(
    days: rand(0..20), hours: rand(1..9), minutes: rand(0..60))
  departure_time = departure_date.strftime("%I:%M %p")
  duration = rand(6..20)
  [departure_date, departure_time, duration]
end

def set_route(airports_id)
  arrival_id = airports_id.sample
  departure_id = airports_id.sample
  departure_id = airports_id.sample until departure_id != arrival_id
  [departure_id, arrival_id]
end

def set(airports_id, airlines)
  economy = rand(10..50) * 1000
  business = rand(51..100) * 1000
  first =  rand(101..200) * 1000
  airline = airlines.sample
  { airline: airline, departure_date: set_time[0], departure_time: set_time[1],
    duration: set_time[2], economy: economy, business: business, first: first,
    departure_id: set_route(airports_id)[0],
    arrival_id: set_route(airports_id)[1] }
end

200.times do
  Flight.create(set(airports_id, airlines))
end
