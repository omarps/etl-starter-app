require "application_system_test_case"

class ClientApplicationsTest < ApplicationSystemTestCase
  setup do
    @client_application = client_applications(:one)
  end

  test "visiting the index" do
    visit client_applications_url
    assert_selector "h1", text: "Client Applications"
  end

  test "creating a Client application" do
    visit client_applications_url
    click_on "New Client Application"

    fill_in "Channel Rates On", with: @client_application.channel_rates_on
    fill_in "Guid", with: @client_application.guid
    fill_in "Internal", with: @client_application.internal
    fill_in "Name", with: @client_application.name
    click_on "Create Client application"

    assert_text "Client application was successfully created"
    click_on "Back"
  end

  test "updating a Client application" do
    visit client_applications_url
    click_on "Edit", match: :first

    fill_in "Channel Rates On", with: @client_application.channel_rates_on
    fill_in "Guid", with: @client_application.guid
    fill_in "Internal", with: @client_application.internal
    fill_in "Name", with: @client_application.name
    click_on "Update Client application"

    assert_text "Client application was successfully updated"
    click_on "Back"
  end

  test "destroying a Client application" do
    visit client_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client application was successfully destroyed"
  end
end
