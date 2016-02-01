class AddCabinToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :cabin, :string
  end
end
