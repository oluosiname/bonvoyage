class AddColumnCodeToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :code, :string, after: :location
  end
end
