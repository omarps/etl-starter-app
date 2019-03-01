require "application_system_test_case"

class ChannelRatesTest < ApplicationSystemTestCase
  setup do
    @channel_rate = channel_rates(:one)
  end

  test "visiting the index" do
    visit channel_rates_url
    assert_selector "h1", text: "Channel Rates"
  end

  test "creating a Channel rate" do
    visit channel_rates_url
    click_on "New Channel Rate"

    fill_in "Amount", with: @channel_rate.amount
    fill_in "Base Rate Type", with: @channel_rate.base_rate_type
    fill_in "Channel Guid", with: @channel_rate.channel_guid
    fill_in "Channel Name", with: @channel_rate.channel_name
    fill_in "Facility Guid", with: @channel_rate.facility_guid
    fill_in "Modifier Type", with: @channel_rate.modifier_type
    fill_in "Rate", with: @channel_rate.rate
    fill_in "Turned Off On", with: @channel_rate.turned_off_on
    fill_in "Turned On", with: @channel_rate.turned_on
    click_on "Create Channel rate"

    assert_text "Channel rate was successfully created"
    click_on "Back"
  end

  test "updating a Channel rate" do
    visit channel_rates_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @channel_rate.amount
    fill_in "Base Rate Type", with: @channel_rate.base_rate_type
    fill_in "Channel Guid", with: @channel_rate.channel_guid
    fill_in "Channel Name", with: @channel_rate.channel_name
    fill_in "Facility Guid", with: @channel_rate.facility_guid
    fill_in "Modifier Type", with: @channel_rate.modifier_type
    fill_in "Rate", with: @channel_rate.rate
    fill_in "Turned Off On", with: @channel_rate.turned_off_on
    fill_in "Turned On", with: @channel_rate.turned_on
    click_on "Update Channel rate"

    assert_text "Channel rate was successfully updated"
    click_on "Back"
  end

  test "destroying a Channel rate" do
    visit channel_rates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Channel rate was successfully destroyed"
  end
end
