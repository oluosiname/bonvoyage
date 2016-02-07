FactoryGirl.define do
  factory :flight do
    departure_id 1
    arrival_id 2
    departure_date Time.now
    departure_time Time.now.strftime("%I:%M %p")
    airline "Sosoliso"
    economy 200_00
    business 300_00
    first 400_00
  end
end
