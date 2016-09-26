class AddForeignKeyForTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :team, index: true, foreign_key: true
  end
end
