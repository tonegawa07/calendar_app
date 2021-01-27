require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  # パスワードが間違えている場合
  test "login with invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: {password: "" }}
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  # パスワードが正しい場合
  test "login with valid password followed by logout" do
    get login_path
    post login_path, params: { session: {password: "password" }}
    assert is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_template '/'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", icp_reservations_path
    assert_select "a[href=?]", cn_reservations_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", icp_reservations_path, count: 0
    assert_select "a[href=?]", cn_reservations_path, count: 0
  end
end
