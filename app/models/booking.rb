class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.get_user_bookings(user_id)
    @bookings = Booking.where("user_id = ?", user_id)
    @bookings
  end

  def is_booked? building_id
    if Booking.joins(:room).where('id = ?, building_id = ? and ((timefrom >= ? and timeto <= ?) or (timefrom <= ? and timefrom >= ?) or (timeto <= ? and timeto >= ?))', self.id, building_id, self.timefrom, self.timeto, self.timefrom, self.timefrom, self.timeto, self.timeto)
      return true;
    else
      return false;
    end
  end

end