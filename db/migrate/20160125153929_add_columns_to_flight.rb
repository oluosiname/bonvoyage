class AddColumnsToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :departure_date, :date, after: :id
    add_column :flights, :departure_time, :string, after: :departure_date
    add_column :flights, :arrival_date, :date, after: :departure_time
    add_column :flights, :arrival_time, :string, after: :arrival_date
    add_column :flights, :code, :string, after: :arrival_time
  end
end
