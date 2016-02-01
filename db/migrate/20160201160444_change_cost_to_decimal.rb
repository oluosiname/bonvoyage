class ChangeCostToDecimal < ActiveRecord::Migration
  def change
    change_column :bookings, :cost, :decimal, :precision => 8, :scale => 2
  end
end
