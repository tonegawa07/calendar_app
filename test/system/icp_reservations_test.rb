require "application_system_test_case"

class IcpReservationsTest < ApplicationSystemTestCase
  setup do
    @icp_reservation = icp_reservations(:one)
  end

  test "visiting the index" do
    visit icp_reservations_url
    assert_selector "h1", text: "Icp Reservations"
  end

  test "creating a Icp reservation" do
    visit icp_reservations_url
    click_on "New Icp Reservation"

    fill_in "End time", with: @icp_reservation.end_time
    fill_in "Information", with: @icp_reservation.information
    fill_in "Lab", with: @icp_reservation.lab
    fill_in "Name", with: @icp_reservation.name
    fill_in "Number of samples", with: @icp_reservation.number_of_samples
    fill_in "Start time", with: @icp_reservation.start_time
    click_on "Create Icp reservation"

    assert_text "Icp reservation was successfully created"
    click_on "Back"
  end

  test "updating a Icp reservation" do
    visit icp_reservations_url
    click_on "Edit", match: :first

    fill_in "End time", with: @icp_reservation.end_time
    fill_in "Information", with: @icp_reservation.information
    fill_in "Lab", with: @icp_reservation.lab
    fill_in "Name", with: @icp_reservation.name
    fill_in "Number of samples", with: @icp_reservation.number_of_samples
    fill_in "Start time", with: @icp_reservation.start_time
    click_on "Update Icp reservation"

    assert_text "Icp reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Icp reservation" do
    visit icp_reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Icp reservation was successfully destroyed"
  end
end
