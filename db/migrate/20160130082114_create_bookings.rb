class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :seats
      t.integer :flight_id
      t.string :user_id
      t.integer :cost
      t.boolean :payment_status
      t.timestamps null: false
    end
  end
end
