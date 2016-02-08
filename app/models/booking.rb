class Booking < ActiveRecord::Base
  belongs_to :flight, foreign_key: :flight_id
  belongs_to :user, foreign_key: :user_id
  has_many :passengers
  accepts_nested_attributes_for :passengers, reject_if: :all_blank, allow_destroy: true

  before_create :set_ref
  before_save :set_seats

  def set_ref
    self.ref = (0..9).to_a.sample(8).join
    set_ref if Booking.find_by_ref(ref)
  end

  def set_seats
    self.seats = passengers.length
  end

  def self.by_user(user_id)
    where(user_id: user_id)
  end
end
