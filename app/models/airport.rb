class Airport < ActiveRecord::Base
  has_many :departures, class_name: "Flight", foreign_key: :departure_id
  has_many :arrivals, class_name: "Flight", foreign_key: :arrival_id
end
