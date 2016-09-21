class User < ApplicationRecord
  has_many :bookings

  def setMember
    self.utype = 'member'
  end
end
