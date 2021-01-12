require 'test_helper'

class CnReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cn_reservation = cn_reservations(:one)
  end

  test "should get index" do
    get cn_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_cn_reservation_url
    assert_response :success
  end

  test "should create cn_reservation" do
    assert_difference('CnReservation.count') do
      post cn_reservations_url, params: { cn_reservation: { end_time: @cn_reservation.end_time, information: @cn_reservation.information, lab: @cn_reservation.lab, name: @cn_reservation.name, number_of_samples: @cn_reservation.number_of_samples, start_time: @cn_reservation.start_time } }
    end

    assert_redirected_to cn_reservation_url(CnReservation.last)
  end

  test "should show cn_reservation" do
    get cn_reservation_url(@cn_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_cn_reservation_url(@cn_reservation)
    assert_response :success
  end

  test "should update cn_reservation" do
    patch cn_reservation_url(@cn_reservation), params: { cn_reservation: { end_time: @cn_reservation.end_time, information: @cn_reservation.information, lab: @cn_reservation.lab, name: @cn_reservation.name, number_of_samples: @cn_reservation.number_of_samples, start_time: @cn_reservation.start_time } }
    assert_redirected_to cn_reservation_url(@cn_reservation)
  end

  test "should destroy cn_reservation" do
    assert_difference('CnReservation.count', -1) do
      delete cn_reservation_url(@cn_reservation)
    end

    assert_redirected_to cn_reservations_url
  end
end
