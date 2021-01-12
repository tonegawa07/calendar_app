require 'test_helper'

class IcpReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icp_reservation = icp_reservations(:one)
  end

  test "should get index" do
    get icp_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_icp_reservation_url
    assert_response :success
  end

  test "should create icp_reservation" do
    assert_difference('IcpReservation.count') do
      post icp_reservations_url, params: { icp_reservation: { end_time: @icp_reservation.end_time, information: @icp_reservation.information, lab: @icp_reservation.lab, name: @icp_reservation.name, number_of_samples: @icp_reservation.number_of_samples, start_time: @icp_reservation.start_time } }
    end

    assert_redirected_to icp_reservation_url(IcpReservation.last)
  end

  test "should show icp_reservation" do
    get icp_reservation_url(@icp_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_icp_reservation_url(@icp_reservation)
    assert_response :success
  end

  test "should update icp_reservation" do
    patch icp_reservation_url(@icp_reservation), params: { icp_reservation: { end_time: @icp_reservation.end_time, information: @icp_reservation.information, lab: @icp_reservation.lab, name: @icp_reservation.name, number_of_samples: @icp_reservation.number_of_samples, start_time: @icp_reservation.start_time } }
    assert_redirected_to icp_reservation_url(@icp_reservation)
  end

  test "should destroy icp_reservation" do
    assert_difference('IcpReservation.count', -1) do
      delete icp_reservation_url(@icp_reservation)
    end

    assert_redirected_to icp_reservations_url
  end
end
