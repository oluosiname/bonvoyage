require "faker"

Airport.destroy_all
Flight.destroy_all

airports_list = [
  { name: "N'djili Airport", location: "Kinshasa, Congo", code: "001" },
  { name: "Leon M'ba International Airport", location: "Libraville, Gabon", code: "002" },
  { name: "Kigali International Airport", location: "Kigali, Rwanda", code: "003" },
  { name: "Julius Nyerere International Airport", location: "Dar es Salam, Tanzania", code: "004" },
  { name: "Addis Ababa Bole International Airport", location: "Addis Ababa, Ethiopia", code: "005" },
  { name: "Cairo International Airport", location: "Cairo, Egypt", code: "006" },
  { name: "Tripoli International Airport", location: "Tripoli, Libya", code: "007" },
  { name: "Mohammed V International Airport", location: "Casablanca, Morrocco", code: "008" },
  { name: "Khartoum International Airport", location: "Khartoum, Sudan", code: "009" },
  { name: "Carthage International Airport", location: "Tunis, Tunisia", code: "010" },
  { name: "Quatro de Fevereiro Airport", location: "Luanda, Angola", code: "011" },
  { name: "Simon Mwansa Kapwepwe Airport", location: "Ndola, Zambia", code: "012" },
  { name: "Cape Town International Airport", location: "Cape Town, South Africa", code: "013" },
  { name: "Lanseria International Airport", location: "Johannesburg, South Africa", code: "014" },
  { name: "Harare International Airport", location: "Harare, Zimbabwe", code: "015" },
  { name: "Douala Airport", location: "Doula, Cameroon", code: "016" },
  { name: "Port Bouet Airport", location: "Abidjan, Ivory Coast", code: "017" },
  { name: "Kotoka International Airport", location: "Accra, Ghana", code: "018" },
  { name: "Nnamdi Azikiwe International Airport", location: "Abuja, Nigeria", code: "019" },
  { name: "Murtala Mohammed International Airport", location: "Lagos, Nigeria", code: "020" }
]

airports_id = []
airlines = ["Dana Air", "Sosoliso", "Bell View", "Kenya Airways", "Arik Air", "Virgin Atlantic", "Sname Air", "Ethiopia Airlines", "British Airways", "South African Express", "Egypt Air" ]

airports_list.each { | airport | airports_id << Airport.create(airport).id }

def set_flight_time
  departure_date = Time.now.advance(days: rand(0..20))
  hr = departure_date.hour.to_s
  min = departure_date.min < 10 ?  "0" << departure_date.min.to_s : departure_date.min.to_s
  departure_time = hr << ":" << min
  duration = rand(6..20)
  [departure_date, departure_time, duration]
end

def set_flight_route(airports_id)
  arrival_id =  airports_id.sample
  departure_id = airports_id.sample
  if departure_id == arrival_id
    arrival_id = airports_id.sample
  end
  [ departure_id, arrival_id ]
end


def set_flight(airports_id, airlines)
  amount = Faker::Commerce.price
  flight_number = [*"0".."9", *"A".."Z"].sample(7).join
  airline = airlines.sample
  { flight_number: flight_number, airline: airline, departure_date: set_flight_time[0], departure_time: set_flight_time[1], duration: set_flight_time[2], amount: amount, departure_id: (set_flight_route(airports_id))[0], arrival_id: (set_flight_route(airports_id))[1] }
end

200.times do
  Flight.create(set_flight(airports_id, airlines))
end
