class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.get_user_bookings(user_id)
    @bookings = Booking.all.select{|booking| booking.users_id == user_id}
    @bookings
  end
end
