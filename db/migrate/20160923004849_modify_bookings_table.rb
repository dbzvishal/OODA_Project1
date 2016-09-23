class ModifyBookingsTable < ActiveRecord::Migration[5.0]
  def up
    remove_column :bookings, :date
    change_column :bookings, :timefrom, :datetime
    change_column :bookings, :timeto, :datetime
  end

  def down
    add_column :bookings, :date, :date
    change_column :bookings, :timefrom, :time
    change_column :bookings, :timeto, :time
  end
end
