require 'test_helper'

class IcpReservationsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @icp_reservation = icp_reservations(:one)
  end

  test "should get index when not logged in" do
    get icp_reservations_path
    assert_redirected_to login_url
  end

  test "should get index when logged in" do
    log_in_as("password")
    get icp_reservations_path
    assert_response :success
    delete logout_path
    log_in_as("guest")
    get icp_reservations_path
    assert_response :success
  end

  test "should get new when logged in as non-admin " do
    log_in_as("guest")
    get new_icp_reservation_path, headers: { "HTTP_REFERER": "http://www.example.com/icp_reservations" }
    assert_redirected_to icp_reservations_url
  end

  test "should get new when logged in as admin " do
    log_in_as("password")
    get new_icp_reservation_path
    assert_response :success
  end

  test "should create icp_reservation" do
    log_in_as("password")
    assert_difference('IcpReservation.count') do
      post icp_reservations_url, params: { icp_reservation: { end_time: @icp_reservation.end_time, information: @icp_reservation.information, lab: @icp_reservation.lab, name: @icp_reservation.name, number_of_samples: @icp_reservation.number_of_samples, start_time: @icp_reservation.start_time } }
    end

    assert_redirected_to icp_reservation_url(IcpReservation.last)
  end

  test "should show icp_reservation" do
    log_in_as("password")
    get icp_reservation_url(@icp_reservation)
    assert_response :success
    delete logout_path
    log_in_as("guest")
    get icp_reservation_url(@icp_reservation)
    assert_response :success
  end

  test "should get edit when logged in as non-admin" do
    log_in_as("guest")
    get edit_icp_reservation_url(@icp_reservation), headers: { "HTTP_REFERER": "http://www.example.com/icp_reservations" }
    assert_redirected_to icp_reservations_url
  end

  test "should get edit when logged in as admin" do
    log_in_as("password")
    get edit_icp_reservation_url(@icp_reservation)
    assert_response :success
  end

  test "should update icp_reservation" do
    log_in_as("password")
    patch icp_reservation_url(@icp_reservation), params: { icp_reservation: { end_time: @icp_reservation.end_time, information: @icp_reservation.information, lab: @icp_reservation.lab, name: @icp_reservation.name, number_of_samples: @icp_reservation.number_of_samples, start_time: @icp_reservation.start_time } }
    assert_redirected_to icp_reservation_url(@icp_reservation)
  end

  test "should destroy icp_reservation when logged in as non-admin" do
    log_in_as("guest")
    assert_no_difference('IcpReservation.count') do
      delete icp_reservation_url(@icp_reservation), headers: { "HTTP_REFERER": "http://www.example.com/icp_reservations" }
    end
    assert_redirected_to icp_reservations_url
  end

  test "should destroy icp_reservation when logged in as admin" do
    log_in_as("password")
    assert_difference('IcpReservation.count', -1) do
      delete icp_reservation_url(@icp_reservation)
    end
    assert_redirected_to icp_reservations_url
  end
end
