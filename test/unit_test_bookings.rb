require 'test/unit'

class Test_Bookings_Controller < Test::Unit::TestCase
  @error_msg=""
  def setup
    @booking_obj = BookingsController.new
  end
  def teardown

  end
  def test_create
    @booking = @booking_obj.create(:id => "1",:password => "secret",:password_confirmation => "secret")
  end
  def test_index
    @bookings_all= @booking_obj.index
    if(!@bookings_all.nil?)
      @bookings_all.each do |booking|
        assert_not_nil(booking.id, "")
        assert_not_nil(booking.timefrom, "")
        assert_not_nil(booking.timeto, "")
        assert_not_nil(booking.user_id, "")
        assert_not_nil(booking.room_id, "")
        assert_equal(true, (booking.timeto>booking.timefrom), "")
        assert_not_equal(true, (booking.timeto - booking.timefrom) > 2.hours, "")
        assert_not_equal(true, (booking.timeto - booking.timefrom) < 30.minutes, "")
        assert_equal(true, User.select(:id).include?(booking.user_id), "")
        assert_equal(true, Room.select(:id).include?(booking.user_id), "")
      end
    end
    #assert(false, @error_msg)
  end
end