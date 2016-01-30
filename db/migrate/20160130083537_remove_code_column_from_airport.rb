class RemoveCodeColumnFromAirport < ActiveRecord::Migration
  def change
    remove_column :airports, :code, :string
  end
end
