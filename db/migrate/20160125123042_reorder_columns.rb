class ReorderColumns < ActiveRecord::Migration
  def change
    change_column :users, :salt, :string, after: :encrypted_password
  end
end
