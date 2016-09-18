class Room < ApplicationRecord
  belongs_to :buildings
  has_many :bookings
end
