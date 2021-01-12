require "application_system_test_case"

class CnReservationsTest < ApplicationSystemTestCase
  setup do
    @cn_reservation = cn_reservations(:one)
  end

  test "visiting the index" do
    visit cn_reservations_url
    assert_selector "h1", text: "Cn Reservations"
  end

  test "creating a Cn reservation" do
    visit cn_reservations_url
    click_on "New Cn Reservation"

    fill_in "End time", with: @cn_reservation.end_time
    fill_in "Information", with: @cn_reservation.information
    fill_in "Lab", with: @cn_reservation.lab
    fill_in "Name", with: @cn_reservation.name
    fill_in "Number of samples", with: @cn_reservation.number_of_samples
    fill_in "Start time", with: @cn_reservation.start_time
    click_on "Create Cn reservation"

    assert_text "Cn reservation was successfully created"
    click_on "Back"
  end

  test "updating a Cn reservation" do
    visit cn_reservations_url
    click_on "Edit", match: :first

    fill_in "End time", with: @cn_reservation.end_time
    fill_in "Information", with: @cn_reservation.information
    fill_in "Lab", with: @cn_reservation.lab
    fill_in "Name", with: @cn_reservation.name
    fill_in "Number of samples", with: @cn_reservation.number_of_samples
    fill_in "Start time", with: @cn_reservation.start_time
    click_on "Update Cn reservation"

    assert_text "Cn reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Cn reservation" do
    visit cn_reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cn reservation was successfully destroyed"
  end
end
