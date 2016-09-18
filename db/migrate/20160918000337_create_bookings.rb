class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :timefrom
      t.time :timeto

      t.timestamps
    end
  end
end
