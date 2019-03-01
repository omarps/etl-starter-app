require 'test_helper'

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get units_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_url
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post units_url, params: { unit: { access_type: @unit.access_type, area: @unit.area, attribute_description: @unit.attribute_description, available_for_move_in: @unit.available_for_move_in, combination_lock_number: @unit.combination_lock_number, complimentary: @unit.complimentary, current_ledger_guid: @unit.current_ledger_guid, current_tenant_guid: @unit.current_tenant_guid, damaged: @unit.damaged, deleted: @unit.deleted, description: @unit.description, door_height: @unit.door_height, door_type: @unit.door_type, door_width: @unit.door_width, floor: @unit.floor, height: @unit.height, length: @unit.length, managed_rate: @unit.managed_rate, name: @unit.name, payment_status: @unit.payment_status, price: @unit.price, rentable: @unit.rentable, size: @unit.size, standard_rate: @unit.standard_rate, status: @unit.status, unit_group_id: @unit.unit_group_id, uom: @unit.uom, width: @unit.width } }
    end

    assert_redirected_to unit_url(Unit.last)
  end

  test "should show unit" do
    get unit_url(@unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_url(@unit)
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit), params: { unit: { access_type: @unit.access_type, area: @unit.area, attribute_description: @unit.attribute_description, available_for_move_in: @unit.available_for_move_in, combination_lock_number: @unit.combination_lock_number, complimentary: @unit.complimentary, current_ledger_guid: @unit.current_ledger_guid, current_tenant_guid: @unit.current_tenant_guid, damaged: @unit.damaged, deleted: @unit.deleted, description: @unit.description, door_height: @unit.door_height, door_type: @unit.door_type, door_width: @unit.door_width, floor: @unit.floor, height: @unit.height, length: @unit.length, managed_rate: @unit.managed_rate, name: @unit.name, payment_status: @unit.payment_status, price: @unit.price, rentable: @unit.rentable, size: @unit.size, standard_rate: @unit.standard_rate, status: @unit.status, unit_group_id: @unit.unit_group_id, uom: @unit.uom, width: @unit.width } }
    assert_redirected_to unit_url(@unit)
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete unit_url(@unit)
    end

    assert_redirected_to units_url
  end
end
