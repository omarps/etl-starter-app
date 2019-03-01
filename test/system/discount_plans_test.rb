require "application_system_test_case"

class DiscountPlansTest < ApplicationSystemTestCase
  setup do
    @discount_plan = discount_plans(:one)
  end

  test "visiting the index" do
    visit discount_plans_url
    assert_selector "h1", text: "Discount Plans"
  end

  test "creating a Discount plan" do
    visit discount_plans_url
    click_on "New Discount Plan"

    fill_in "Always Discount Plan Discount Guid", with: @discount_plan.always_discount_plan_discount_guid
    fill_in "Api Association Guids", with: @discount_plan.api_association_guids
    fill_in "Auto Apply", with: @discount_plan.auto_apply
    fill_in "Availability Text", with: @discount_plan.availability_text
    fill_in "Available For All Facilities", with: @discount_plan.available_for_all_facilities
    fill_in "Deleted", with: @discount_plan.deleted
    fill_in "Description", with: @discount_plan.description
    fill_in "End Date", with: @discount_plan.end_date
    fill_in "Existing Tenant Only", with: @discount_plan.existing_tenant_only
    fill_in "Guid", with: @discount_plan.guid
    fill_in "Hide From Website", with: @discount_plan.hide_from_website
    fill_in "Kind", with: @discount_plan.kind
    fill_in "Min Occupancy Months", with: @discount_plan.min_occupancy_months
    fill_in "Min Occupancy Required", with: @discount_plan.min_occupancy_required
    fill_in "Move In Only", with: @discount_plan.move_in_only
    fill_in "Name", with: @discount_plan.name
    fill_in "Prepay Months", with: @discount_plan.prepay_months
    fill_in "Prepay Required", with: @discount_plan.prepay_required
    fill_in "Priority", with: @discount_plan.priority
    fill_in "Promotion Type", with: @discount_plan.promotion_type
    fill_in "Public Description", with: @discount_plan.public_description
    fill_in "Requirements Text", with: @discount_plan.requirements_text
    fill_in "Role Permission", with: @discount_plan.role_permission
    fill_in "Round To Nearest", with: @discount_plan.round_to_nearest
    fill_in "Start Date", with: @discount_plan.start_date
    fill_in "Tenant Account Kind Guid", with: @discount_plan.tenant_account_kind_guid
    fill_in "Turned On", with: @discount_plan.turned_on
    click_on "Create Discount plan"

    assert_text "Discount plan was successfully created"
    click_on "Back"
  end

  test "updating a Discount plan" do
    visit discount_plans_url
    click_on "Edit", match: :first

    fill_in "Always Discount Plan Discount Guid", with: @discount_plan.always_discount_plan_discount_guid
    fill_in "Api Association Guids", with: @discount_plan.api_association_guids
    fill_in "Auto Apply", with: @discount_plan.auto_apply
    fill_in "Availability Text", with: @discount_plan.availability_text
    fill_in "Available For All Facilities", with: @discount_plan.available_for_all_facilities
    fill_in "Deleted", with: @discount_plan.deleted
    fill_in "Description", with: @discount_plan.description
    fill_in "End Date", with: @discount_plan.end_date
    fill_in "Existing Tenant Only", with: @discount_plan.existing_tenant_only
    fill_in "Guid", with: @discount_plan.guid
    fill_in "Hide From Website", with: @discount_plan.hide_from_website
    fill_in "Kind", with: @discount_plan.kind
    fill_in "Min Occupancy Months", with: @discount_plan.min_occupancy_months
    fill_in "Min Occupancy Required", with: @discount_plan.min_occupancy_required
    fill_in "Move In Only", with: @discount_plan.move_in_only
    fill_in "Name", with: @discount_plan.name
    fill_in "Prepay Months", with: @discount_plan.prepay_months
    fill_in "Prepay Required", with: @discount_plan.prepay_required
    fill_in "Priority", with: @discount_plan.priority
    fill_in "Promotion Type", with: @discount_plan.promotion_type
    fill_in "Public Description", with: @discount_plan.public_description
    fill_in "Requirements Text", with: @discount_plan.requirements_text
    fill_in "Role Permission", with: @discount_plan.role_permission
    fill_in "Round To Nearest", with: @discount_plan.round_to_nearest
    fill_in "Start Date", with: @discount_plan.start_date
    fill_in "Tenant Account Kind Guid", with: @discount_plan.tenant_account_kind_guid
    fill_in "Turned On", with: @discount_plan.turned_on
    click_on "Update Discount plan"

    assert_text "Discount plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Discount plan" do
    visit discount_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Discount plan was successfully destroyed"
  end
end
