class AddRefColumnToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :ref, :string
  end
end
