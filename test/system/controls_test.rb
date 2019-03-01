require "application_system_test_case"

class ControlsTest < ApplicationSystemTestCase
  setup do
    @control = controls(:one)
  end

  test "visiting the index" do
    visit controls_url
    assert_selector "h1", text: "Controls"
  end

  test "creating a Control" do
    visit controls_url
    click_on "New Control"

    fill_in "Applicable Discount Plans Count", with: @control.applicable_discount_plans_count
    fill_in "Deleted", with: @control.deleted
    fill_in "Deleted On", with: @control.deleted_on
    fill_in "Guid", with: @control.guid
    fill_in "Kind", with: @control.kind
    fill_in "Max Value", with: @control.max_value
    fill_in "Min Value", with: @control.min_value
    fill_in "Requirements Text", with: @control.requirements_text
    fill_in "Unit Type", with: @control.unit_type_id
    click_on "Create Control"

    assert_text "Control was successfully created"
    click_on "Back"
  end

  test "updating a Control" do
    visit controls_url
    click_on "Edit", match: :first

    fill_in "Applicable Discount Plans Count", with: @control.applicable_discount_plans_count
    fill_in "Deleted", with: @control.deleted
    fill_in "Deleted On", with: @control.deleted_on
    fill_in "Guid", with: @control.guid
    fill_in "Kind", with: @control.kind
    fill_in "Max Value", with: @control.max_value
    fill_in "Min Value", with: @control.min_value
    fill_in "Requirements Text", with: @control.requirements_text
    fill_in "Unit Type", with: @control.unit_type_id
    click_on "Update Control"

    assert_text "Control was successfully updated"
    click_on "Back"
  end

  test "destroying a Control" do
    visit controls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Control was successfully destroyed"
  end
end
