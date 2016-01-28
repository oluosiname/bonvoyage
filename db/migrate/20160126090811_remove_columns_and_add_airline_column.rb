class RemoveColumnsAndAddAirlineColumn < ActiveRecord::Migration
  def change
    remove_column :flights, :arrival_time, :arrival_date
  end
end
