require 'test_helper'

class ControlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @control = controls(:one)
  end

  test "should get index" do
    get controls_url
    assert_response :success
  end

  test "should get new" do
    get new_control_url
    assert_response :success
  end

  test "should create control" do
    assert_difference('Control.count') do
      post controls_url, params: { control: { applicable_discount_plans_count: @control.applicable_discount_plans_count, deleted: @control.deleted, deleted_on: @control.deleted_on, guid: @control.guid, kind: @control.kind, max_value: @control.max_value, min_value: @control.min_value, requirements_text: @control.requirements_text, unit_type_id: @control.unit_type_id } }
    end

    assert_redirected_to control_url(Control.last)
  end

  test "should show control" do
    get control_url(@control)
    assert_response :success
  end

  test "should get edit" do
    get edit_control_url(@control)
    assert_response :success
  end

  test "should update control" do
    patch control_url(@control), params: { control: { applicable_discount_plans_count: @control.applicable_discount_plans_count, deleted: @control.deleted, deleted_on: @control.deleted_on, guid: @control.guid, kind: @control.kind, max_value: @control.max_value, min_value: @control.min_value, requirements_text: @control.requirements_text, unit_type_id: @control.unit_type_id } }
    assert_redirected_to control_url(@control)
  end

  test "should destroy control" do
    assert_difference('Control.count', -1) do
      delete control_url(@control)
    end

    assert_redirected_to controls_url
  end
end
