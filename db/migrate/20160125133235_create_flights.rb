class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :amount
      t.integer :departure_id
      t.integer :arrival_id

      t.timestamps null: false
    end
  end
end
