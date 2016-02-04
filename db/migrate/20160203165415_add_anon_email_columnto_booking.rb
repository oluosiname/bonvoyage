class AddAnonEmailColumntoBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :anon_email, :string
  end
end
