class ModifyBookingsTable < ActiveRecord::Migration[5.0]
  def up
    remove_column :bookings, :date
    remove_column :bookings, :timefrom
    remove_column :bookings, :timeto
    add_column :bookings, :timefrom, :datetime
    add_column :bookings, :timeto, :datetime
  end

  def down
    add_column :bookings, :date, :date
    remove_column :bookings, :timefrom
    remove_column :bookings, :timeto
    add_column :bookings, :timefrom, :time
    add_column :bookings, :timeto, :time
  end
end
