require "application_system_test_case"

class UnitTypesTest < ApplicationSystemTestCase
  setup do
    @unit_type = unit_types(:one)
  end

  test "visiting the index" do
    visit unit_types_url
    assert_selector "h1", text: "Unit Types"
  end

  test "creating a Unit type" do
    visit unit_types_url
    click_on "New Unit Type"

    fill_in "Code And Description", with: @unit_type.code_and_description
    fill_in "Deleted", with: @unit_type.deleted
    fill_in "Guid", with: @unit_type.guid
    fill_in "Internal Account Code", with: @unit_type.internal_account_code
    fill_in "Name", with: @unit_type.name
    click_on "Create Unit type"

    assert_text "Unit type was successfully created"
    click_on "Back"
  end

  test "updating a Unit type" do
    visit unit_types_url
    click_on "Edit", match: :first

    fill_in "Code And Description", with: @unit_type.code_and_description
    fill_in "Deleted", with: @unit_type.deleted
    fill_in "Guid", with: @unit_type.guid
    fill_in "Internal Account Code", with: @unit_type.internal_account_code
    fill_in "Name", with: @unit_type.name
    click_on "Update Unit type"

    assert_text "Unit type was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit type" do
    visit unit_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit type was successfully destroyed"
  end
end
