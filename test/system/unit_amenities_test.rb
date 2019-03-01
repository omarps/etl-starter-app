require "application_system_test_case"

class UnitAmenitiesTest < ApplicationSystemTestCase
  setup do
    @unit_amenity = unit_amenities(:one)
  end

  test "visiting the index" do
    visit unit_amenities_url
    assert_selector "h1", text: "Unit Amenities"
  end

  test "creating a Unit amenity" do
    visit unit_amenities_url
    click_on "New Unit Amenity"

    fill_in "Guid", with: @unit_amenity.guid
    fill_in "Name", with: @unit_amenity.name
    fill_in "Short Code", with: @unit_amenity.short_code
    fill_in "Show In Sales Center Filter Dropdown", with: @unit_amenity.show_in_sales_center_filter_dropdown
    click_on "Create Unit amenity"

    assert_text "Unit amenity was successfully created"
    click_on "Back"
  end

  test "updating a Unit amenity" do
    visit unit_amenities_url
    click_on "Edit", match: :first

    fill_in "Guid", with: @unit_amenity.guid
    fill_in "Name", with: @unit_amenity.name
    fill_in "Short Code", with: @unit_amenity.short_code
    fill_in "Show In Sales Center Filter Dropdown", with: @unit_amenity.show_in_sales_center_filter_dropdown
    click_on "Update Unit amenity"

    assert_text "Unit amenity was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit amenity" do
    visit unit_amenities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit amenity was successfully destroyed"
  end
end
