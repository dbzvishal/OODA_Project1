require 'test_helper'

#class LoginControllerTest < ActionDispatch::IntegrationTest
class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get login_index_url
    assert_response :success
  end
end
