require 'test_helper'

#class UsersControllerTest < ActionDispatch::IntegrationTest
class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get user index" do
    get users_index_url
    assert_response :success
  end

  test "should get admin index" do
    get users_admin_index_url
    assert_response :success
  end

  test "should get new" do
    get add_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post create_user_url, params: { user: { password: @user.password, uemail: @user.uemail, uname: @user.uname, uphone: @user.uphone } }
    end

    assert_redirected_to root_path
  end

  test "should show user" do
    get users_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch update_user_url(@user), params: { user: { password: @user.password, uemail: @user.uemail, uname: @user.uname, uphone: @user.uphone } }
    assert_redirected_to root_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete users_destroy_url(@user)
    end

    assert_redirected_to users_index_url
  end
end
