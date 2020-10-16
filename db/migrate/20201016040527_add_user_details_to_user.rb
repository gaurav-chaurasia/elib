class AddUserDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_number, :bigint
    add_column :users, :address, :string
    add_column :users, :admission_date, :date
  end
end
