class AddFlightDurationColumnToFlightTable < ActiveRecord::Migration
  def change
    add_column :flights, :duration, :string, after: :arrival_time
  end
end
