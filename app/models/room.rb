class Room < ApplicationRecord
  belongs_to :building
  has_many :bookings

  def set_available
    self.status = 'available'
  end
end
