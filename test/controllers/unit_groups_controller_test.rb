require 'test_helper'

class UnitGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_group = unit_groups(:one)
  end

  test "should get index" do
    get unit_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_group_url
    assert_response :success
  end

  test "should create unit_group" do
    assert_difference('UnitGroup.count') do
      post unit_groups_url, params: { unit_group: { active_rate_type: @unit_group.active_rate_type, area: @unit_group.area, attribute_description: @unit_group.attribute_description, available_units_count: @unit_group.available_units_count, average_rent: @unit_group.average_rent, channel_rate_id: @unit_group.channel_rate_id, description: @unit_group.description, due_at_move_in: @unit_group.due_at_move_in, due_at_move_in_without_fees: @unit_group.due_at_move_in_without_fees, due_monthly: @unit_group.due_monthly, floor: @unit_group.floor, group_key: @unit_group.group_key, guid: @unit_group.guid, height: @unit_group.height, length: @unit_group.length, name: @unit_group.name, occupancy_percent: @unit_group.occupancy_percent, price: @unit_group.price, reduced_price: @unit_group.reduced_price, size: @unit_group.size, standard_rate: @unit_group.standard_rate, total_non_excluded_units_count: @unit_group.total_non_excluded_units_count, total_units_count: @unit_group.total_units_count, unit_type_id: @unit_group.unit_type_id, width: @unit_group.width } }
    end

    assert_redirected_to unit_group_url(UnitGroup.last)
  end

  test "should show unit_group" do
    get unit_group_url(@unit_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_group_url(@unit_group)
    assert_response :success
  end

  test "should update unit_group" do
    patch unit_group_url(@unit_group), params: { unit_group: { active_rate_type: @unit_group.active_rate_type, area: @unit_group.area, attribute_description: @unit_group.attribute_description, available_units_count: @unit_group.available_units_count, average_rent: @unit_group.average_rent, channel_rate_id: @unit_group.channel_rate_id, description: @unit_group.description, due_at_move_in: @unit_group.due_at_move_in, due_at_move_in_without_fees: @unit_group.due_at_move_in_without_fees, due_monthly: @unit_group.due_monthly, floor: @unit_group.floor, group_key: @unit_group.group_key, guid: @unit_group.guid, height: @unit_group.height, length: @unit_group.length, name: @unit_group.name, occupancy_percent: @unit_group.occupancy_percent, price: @unit_group.price, reduced_price: @unit_group.reduced_price, size: @unit_group.size, standard_rate: @unit_group.standard_rate, total_non_excluded_units_count: @unit_group.total_non_excluded_units_count, total_units_count: @unit_group.total_units_count, unit_type_id: @unit_group.unit_type_id, width: @unit_group.width } }
    assert_redirected_to unit_group_url(@unit_group)
  end

  test "should destroy unit_group" do
    assert_difference('UnitGroup.count', -1) do
      delete unit_group_url(@unit_group)
    end

    assert_redirected_to unit_groups_url
  end
end
