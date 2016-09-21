class Room < ApplicationRecord
  belongs_to :building
  has_many :bookings

  def set_available!
    self.status = 'available'
  end

  def self.get_size(size)
    size_num = 0
    case size
      when 'Small'
        size_num = 4
      when 'Medium'
        size_num = 6
      when 'Large'
        size_num = 12
    end
    size_num
  end
end
