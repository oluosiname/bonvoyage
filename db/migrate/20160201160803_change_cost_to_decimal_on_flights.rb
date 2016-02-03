class ChangeCostToDecimalOnFlights < ActiveRecord::Migration
  def change
    change_column :flights, :economy, :decimal, precision: 8, scale: 2
    change_column :flights, :business, :decimal, precision: 8, scale: 2
    change_column :flights, :first, :decimal, precision: 8, scale: 2
  end
end
