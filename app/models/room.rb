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

  def self.get_size_in_words(size_num)
    size = 'Error'
    case size_num
      when 4
        size = 'Small'
      when 6
        size = 'Medium'
      when 12
        size = 'Large'
    end
    size
  end

  def self.get_searched_rooms(params)
    rooms = nil
    if params['status'] != '-1'
      cur_time = Time.now
        rooms = Room.joins(:building).left_outer_joins(:bookings).select('rooms.id', :rnumber, :bname, :size).where('timefrom <= ? and timeto > ?', cur_time, cur_time).group(['rooms.id', 'buildings.bname'])
      if params['status'] == 'Available'
        room_arr = rooms.collect { |room| room.id}
        room_arr << -1
        rooms = Room.joins(:building).select('rooms.id', :rnumber, :bname, :size).where('rooms.id NOT IN (?)', room_arr).group(['rooms.id', 'buildings.bname'])
      end
    end
    if params['room_number'] != ''
      if rooms.nil?
        rooms = Room.joins(:building).select('rooms.id', :rnumber, :bname, :size).where('rnumber like ?', "%#{params['room_number']}%")
      else
        rooms = rooms.select('rooms.id', :rnumber, :bname, :size).where('rnumber like ?', "%#{params['room_number']}%")
      end
    end
    if params['building_name'] != '-1'
      if rooms.nil?
        rooms = Room.joins(:building).select('rooms.id', :rnumber, :bname, :size).where('building_id = ?', params['building_name'])
      else
        rooms = rooms.select('rooms.id', :rnumber, :bname, :size).where('building_id = ?', params['building_name'])
      end
    end
    if params['size_name'] != '-1'
      size = Room.get_size params['size_name']
      if rooms.nil?
        rooms = Room.joins(:building).where('size = ?', size).select('rooms.id', :rnumber, :bname, :size)
      else
        rooms = rooms.where('size = ?', size).select('rooms.id', :rnumber, :bname, :size)
      end
    end
    rooms = Room.joins(:building).select('rooms.id', :rnumber, :bname, :size).all if rooms.nil?

    rooms
  end
end
