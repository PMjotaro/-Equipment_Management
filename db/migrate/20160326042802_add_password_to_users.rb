class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_hash, :string
    add_column :users, :salt, :string
  end
end
