require 'test_helper'

class ChannelRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel_rate = channel_rates(:one)
  end

  test "should get index" do
    get channel_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_channel_rate_url
    assert_response :success
  end

  test "should create channel_rate" do
    assert_difference('ChannelRate.count') do
      post channel_rates_url, params: { channel_rate: { amount: @channel_rate.amount, base_rate_type: @channel_rate.base_rate_type, channel_guid: @channel_rate.channel_guid, channel_name: @channel_rate.channel_name, facility_guid: @channel_rate.facility_guid, modifier_type: @channel_rate.modifier_type, rate: @channel_rate.rate, turned_off_on: @channel_rate.turned_off_on, turned_on: @channel_rate.turned_on } }
    end

    assert_redirected_to channel_rate_url(ChannelRate.last)
  end

  test "should show channel_rate" do
    get channel_rate_url(@channel_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_channel_rate_url(@channel_rate)
    assert_response :success
  end

  test "should update channel_rate" do
    patch channel_rate_url(@channel_rate), params: { channel_rate: { amount: @channel_rate.amount, base_rate_type: @channel_rate.base_rate_type, channel_guid: @channel_rate.channel_guid, channel_name: @channel_rate.channel_name, facility_guid: @channel_rate.facility_guid, modifier_type: @channel_rate.modifier_type, rate: @channel_rate.rate, turned_off_on: @channel_rate.turned_off_on, turned_on: @channel_rate.turned_on } }
    assert_redirected_to channel_rate_url(@channel_rate)
  end

  test "should destroy channel_rate" do
    assert_difference('ChannelRate.count', -1) do
      delete channel_rate_url(@channel_rate)
    end

    assert_redirected_to channel_rates_url
  end
end
