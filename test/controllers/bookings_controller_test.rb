require 'test_helper'

#class BookingsControllerTest < ActionDispatch::IntegrationTest
class BookingsControllerTest < ActionController::TestCase
    setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should get new" do
    get add_booking_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post create_booking_url, params: { booking: { timefrom: @booking.timefrom, timeto: @booking.timeto, user_id: @booking.user_id, room_id: @booking.room_id } }
    end

    #assert_redirected_to booking_url(Booking.last)
  end

  test "should show booking" do
    get show_booking_url(@booking.user_id)
    assert_response :success
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete bookings_destroy_url(@booking)
    end

    #assert_redirected_to bookings_url
  end
end
