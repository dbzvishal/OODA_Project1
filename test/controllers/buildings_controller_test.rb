require 'test_helper'

#class BuildingsControllerTest < ActionDispatch::IntegrationTest
class BuildingsControllerTest < ActionController::TestCase
  setup do
    @building = buildings(:one)
  end

  test "should show building" do
    get show_building_url(@building)
    assert_response :success
  end
end
