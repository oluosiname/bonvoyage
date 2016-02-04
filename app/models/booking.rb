class Booking < ActiveRecord::Base
  belongs_to :flight, foreign_key: :flight_id
  belongs_to :user, foreign_key: :user_id
  has_many :passengers
  accepts_nested_attributes_for :passengers

  before_create :set_ref

  def set_ref
    self.ref = (0..9).to_a.sample(8).join
    set_ref if Booking.find_by_ref(ref)
  end

  def self.by_user(user_id)
    where(user_id: user_id)
  end

  def self.available
    where("departure_date > ?", Time.now)
  end
end
