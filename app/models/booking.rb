class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.get_user_bookings(user_id)
    @bookings = Booking.all.select{|booking| booking.user_id == user_id}
    @bookings
  end

  def self.is_admin(user_id)
    if( User.find(user_id).utype == "admin")
      @admin = true
    else
      @admin = false
    end
  end

  def self.get_room_for_building (building_id)
    @rooms = Room.where(["building_id = ?", building_id ])
    @rooms
  end

end
