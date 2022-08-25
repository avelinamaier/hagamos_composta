class ChangeReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :subscription, foreign_key: true
    remove_reference :bookings, :subscription, index: true, foreign_key: true
    add_column :bookings, :status, :boolean
  end
end
