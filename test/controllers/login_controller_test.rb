require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index,show" do
    get login_index,show_url
    assert_response :success
  end

end
