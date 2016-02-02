class ChangeCostToInteger < ActiveRecord::Migration
  def change
    change_column :bookings, :cost, :integer
    change_column :flights, :economy, :integer
    change_column :flights, :business, :integer
    change_column :flights, :first, :integer
    change_column :passengers, :cost, :integer
  end
end
