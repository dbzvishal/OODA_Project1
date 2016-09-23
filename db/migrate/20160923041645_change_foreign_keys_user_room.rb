class ChangeForeignKeysUserRoom < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bookings, :rooms, index: true
    add_reference :bookings, :room, index: true, foreign_key: true
    remove_reference :bookings, :users, index: true
    add_reference :bookings, :user, index: true, foreign_key: true
  end
end
