class AddFieldToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end
end
