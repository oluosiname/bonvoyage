class AddCabinClassToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :economy, :integer
    add_column :flights, :business, :integer
    add_column :flights, :first, :integer
  end
end
