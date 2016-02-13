class Flight < ActiveRecord::Base
  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"
  has_many :bookings

  scope(
    :by_route,
    lambda do |from, to|
      where("departure_id = ? AND arrival_id = ?", from, to)
    end
  )

  scope :available, -> { where("departure_date >= ?", Time.now) }

  scope :by_date, ->(date) { where("departure_date = ?", date) }

  def self.per_page(page)
    Flight.offset(10 * (page.to_i - 1)).
      limit(10).order("departure_date ASC").available
  end
end
