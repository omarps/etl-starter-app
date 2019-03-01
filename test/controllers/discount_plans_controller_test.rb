require 'test_helper'

class DiscountPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount_plan = discount_plans(:one)
  end

  test "should get index" do
    get discount_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_plan_url
    assert_response :success
  end

  test "should create discount_plan" do
    assert_difference('DiscountPlan.count') do
      post discount_plans_url, params: { discount_plan: { always_discount_plan_discount_guid: @discount_plan.always_discount_plan_discount_guid, api_association_guids: @discount_plan.api_association_guids, auto_apply: @discount_plan.auto_apply, availability_text: @discount_plan.availability_text, available_for_all_facilities: @discount_plan.available_for_all_facilities, deleted: @discount_plan.deleted, description: @discount_plan.description, end_date: @discount_plan.end_date, existing_tenant_only: @discount_plan.existing_tenant_only, guid: @discount_plan.guid, hide_from_website: @discount_plan.hide_from_website, kind: @discount_plan.kind, min_occupancy_months: @discount_plan.min_occupancy_months, min_occupancy_required: @discount_plan.min_occupancy_required, move_in_only: @discount_plan.move_in_only, name: @discount_plan.name, prepay_months: @discount_plan.prepay_months, prepay_required: @discount_plan.prepay_required, priority: @discount_plan.priority, promotion_type: @discount_plan.promotion_type, public_description: @discount_plan.public_description, requirements_text: @discount_plan.requirements_text, role_permission: @discount_plan.role_permission, round_to_nearest: @discount_plan.round_to_nearest, start_date: @discount_plan.start_date, tenant_account_kind_guid: @discount_plan.tenant_account_kind_guid, turned_on: @discount_plan.turned_on } }
    end

    assert_redirected_to discount_plan_url(DiscountPlan.last)
  end

  test "should show discount_plan" do
    get discount_plan_url(@discount_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_discount_plan_url(@discount_plan)
    assert_response :success
  end

  test "should update discount_plan" do
    patch discount_plan_url(@discount_plan), params: { discount_plan: { always_discount_plan_discount_guid: @discount_plan.always_discount_plan_discount_guid, api_association_guids: @discount_plan.api_association_guids, auto_apply: @discount_plan.auto_apply, availability_text: @discount_plan.availability_text, available_for_all_facilities: @discount_plan.available_for_all_facilities, deleted: @discount_plan.deleted, description: @discount_plan.description, end_date: @discount_plan.end_date, existing_tenant_only: @discount_plan.existing_tenant_only, guid: @discount_plan.guid, hide_from_website: @discount_plan.hide_from_website, kind: @discount_plan.kind, min_occupancy_months: @discount_plan.min_occupancy_months, min_occupancy_required: @discount_plan.min_occupancy_required, move_in_only: @discount_plan.move_in_only, name: @discount_plan.name, prepay_months: @discount_plan.prepay_months, prepay_required: @discount_plan.prepay_required, priority: @discount_plan.priority, promotion_type: @discount_plan.promotion_type, public_description: @discount_plan.public_description, requirements_text: @discount_plan.requirements_text, role_permission: @discount_plan.role_permission, round_to_nearest: @discount_plan.round_to_nearest, start_date: @discount_plan.start_date, tenant_account_kind_guid: @discount_plan.tenant_account_kind_guid, turned_on: @discount_plan.turned_on } }
    assert_redirected_to discount_plan_url(@discount_plan)
  end

  test "should destroy discount_plan" do
    assert_difference('DiscountPlan.count', -1) do
      delete discount_plan_url(@discount_plan)
    end

    assert_redirected_to discount_plans_url
  end
end
