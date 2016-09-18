class Booking < ApplicationRecord
  has_one :room
  has_one :user
end
