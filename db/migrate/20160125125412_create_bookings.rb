class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :ticket_number
      t.string :flight_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
