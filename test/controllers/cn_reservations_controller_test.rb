require 'test_helper'

class CnReservationsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @cn_reservation = cn_reservations(:one)
  end

  test "should get index when not logged in" do
    get cn_reservations_path
    assert_redirected_to login_url
  end

  test "should get index when logged in" do
    log_in_as("password")
    get cn_reservations_path
    assert_response :success
    delete logout_path
    log_in_as("gest")
    get cn_reservations_path
    assert_response :success
  end

  test "should get new when logged in as non-admin" do
    log_in_as("gest")
    get new_cn_reservation_path, headers: { "HTTP_REFERER": "http://www.example.com/cn_reservations" }
    assert_redirected_to cn_reservations_url
  end

  test "should get new when logged in as admin" do
    log_in_as("password")
    get new_cn_reservation_url
    assert_response :success
  end

  test "should create cn_reservation" do
    log_in_as("password")
    assert_difference('CnReservation.count') do
      post cn_reservations_url, params: { cn_reservation: { end_time: @cn_reservation.end_time, information: @cn_reservation.information, lab: @cn_reservation.lab, name: @cn_reservation.name, number_of_samples: @cn_reservation.number_of_samples, start_time: @cn_reservation.start_time } }
    end

    assert_redirected_to cn_reservation_url(CnReservation.last)
  end

  test "should show cn_reservation" do
    log_in_as("password")
    get cn_reservation_url(@cn_reservation)
    assert_response :success
    delete logout_path
    log_in_as("gest")
    get cn_reservation_url(@cn_reservation)
    assert_response :success
  end

  test "should get edit when logged in as non-admin" do
    log_in_as("gest")
    get edit_cn_reservation_url(@cn_reservation), headers: { "HTTP_REFERER": "http://www.example.com/cn_reservations" }
    assert_redirected_to cn_reservations_url
  end

  test "should get edit when logged in as admin" do
    log_in_as("password")
    get edit_cn_reservation_url(@cn_reservation)
    assert_response :success
  end

  test "should update cn_reservation" do
    log_in_as("password")
    patch cn_reservation_url(@cn_reservation), params: { cn_reservation: { end_time: @cn_reservation.end_time, information: @cn_reservation.information, lab: @cn_reservation.lab, name: @cn_reservation.name, number_of_samples: @cn_reservation.number_of_samples, start_time: @cn_reservation.start_time } }
    assert_redirected_to cn_reservation_url(@cn_reservation)
  end

  test "should destroy cn_reservation when logged in as non-admin" do
    log_in_as("gest")
    assert_no_difference('CnReservation.count') do
      delete cn_reservation_url(@cn_reservation), headers: { "HTTP_REFERER": "http://www.example.com/cn_reservations" }
    end
    assert_redirected_to cn_reservations_url
  end

  test "should destroy cn_reservation when logged in as admin" do
    log_in_as("password")
    assert_difference('CnReservation.count', -1) do
      delete cn_reservation_url(@cn_reservation)
    end
    assert_redirected_to cn_reservations_url
  end
end
