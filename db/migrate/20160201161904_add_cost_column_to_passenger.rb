class AddCostColumnToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :cost,  :decimal, :precision => 8, :scale => 2
  end
end
