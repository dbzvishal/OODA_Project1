require 'test_helper'

#class RoomsControllerTest < ActionDispatch::IntegrationTest
class RoomsControllerTest < ActionController::TestCase
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get add_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post create_room_url, params: { room: { rnumber: @room.rnumber } }
    end

    assert_redirected_to rooms_url
  end

  test "should show room" do
    get show_room_url(@room)
    assert_response :success
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete rooms_destroy_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
