class RemoveAirlineColumn < ActiveRecord::Migration
  def change
    remove_column :flights, :airline, :date
  end
end
