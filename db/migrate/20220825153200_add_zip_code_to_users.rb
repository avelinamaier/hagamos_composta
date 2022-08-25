class AddZipCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :zip_code, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :pick_up_status, :boolean, default: false
    add_column :users, :phone, :string
  end
end
