class AddAirlineColumn < ActiveRecord::Migration
  def change
    rename_column :flights, :arrival_date, :airline
  end
end
