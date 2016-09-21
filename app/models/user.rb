class User < ApplicationRecord
  has_many :bookings

  def setMember
    self.utype = 'member'
  end
  def setAdmin
    self.utype = 'admin'
  end
end
