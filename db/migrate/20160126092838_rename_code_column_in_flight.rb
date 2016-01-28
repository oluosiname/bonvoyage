class RenameCodeColumnInFlight < ActiveRecord::Migration
  def change
    rename_column :flights,:code, :flight_number
  end
end
