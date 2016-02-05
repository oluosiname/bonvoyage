class RemoveEmailColumnFromPassenger < ActiveRecord::Migration
  def change
    remove_column :passengers, :first_name, :string
    remove_column :passengers, :last_name, :string
    rename_column :passengers, :email, :name
  end
end
