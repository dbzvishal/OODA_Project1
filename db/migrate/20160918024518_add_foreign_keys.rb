class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :buildings, index: true, foreign_key: true
    add_reference :bookings, :users, index: true, foreign_key: true
    add_reference :bookings, :rooms, index: true, foreign_key: true
  end
end
