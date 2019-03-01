require "application_system_test_case"

class UnitGroupsTest < ApplicationSystemTestCase
  setup do
    @unit_group = unit_groups(:one)
  end

  test "visiting the index" do
    visit unit_groups_url
    assert_selector "h1", text: "Unit Groups"
  end

  test "creating a Unit group" do
    visit unit_groups_url
    click_on "New Unit Group"

    fill_in "Active Rate Type", with: @unit_group.active_rate_type
    fill_in "Area", with: @unit_group.area
    fill_in "Attribute Description", with: @unit_group.attribute_description
    fill_in "Available Units Count", with: @unit_group.available_units_count
    fill_in "Average Rent", with: @unit_group.average_rent
    fill_in "Channel Rate", with: @unit_group.channel_rate_id
    fill_in "Description", with: @unit_group.description
    fill_in "Due At Move In", with: @unit_group.due_at_move_in
    fill_in "Due At Move In Without Fees", with: @unit_group.due_at_move_in_without_fees
    fill_in "Due Monthly", with: @unit_group.due_monthly
    fill_in "Floor", with: @unit_group.floor
    fill_in "Group Key", with: @unit_group.group_key
    fill_in "Guid", with: @unit_group.guid
    fill_in "Height", with: @unit_group.height
    fill_in "Length", with: @unit_group.length
    fill_in "Name", with: @unit_group.name
    fill_in "Occupancy Percent", with: @unit_group.occupancy_percent
    fill_in "Price", with: @unit_group.price
    fill_in "Reduced Price", with: @unit_group.reduced_price
    fill_in "Size", with: @unit_group.size
    fill_in "Standard Rate", with: @unit_group.standard_rate
    fill_in "Total Non Excluded Units Count", with: @unit_group.total_non_excluded_units_count
    fill_in "Total Units Count", with: @unit_group.total_units_count
    fill_in "Unit Type", with: @unit_group.unit_type_id
    fill_in "Width", with: @unit_group.width
    click_on "Create Unit group"

    assert_text "Unit group was successfully created"
    click_on "Back"
  end

  test "updating a Unit group" do
    visit unit_groups_url
    click_on "Edit", match: :first

    fill_in "Active Rate Type", with: @unit_group.active_rate_type
    fill_in "Area", with: @unit_group.area
    fill_in "Attribute Description", with: @unit_group.attribute_description
    fill_in "Available Units Count", with: @unit_group.available_units_count
    fill_in "Average Rent", with: @unit_group.average_rent
    fill_in "Channel Rate", with: @unit_group.channel_rate_id
    fill_in "Description", with: @unit_group.description
    fill_in "Due At Move In", with: @unit_group.due_at_move_in
    fill_in "Due At Move In Without Fees", with: @unit_group.due_at_move_in_without_fees
    fill_in "Due Monthly", with: @unit_group.due_monthly
    fill_in "Floor", with: @unit_group.floor
    fill_in "Group Key", with: @unit_group.group_key
    fill_in "Guid", with: @unit_group.guid
    fill_in "Height", with: @unit_group.height
    fill_in "Length", with: @unit_group.length
    fill_in "Name", with: @unit_group.name
    fill_in "Occupancy Percent", with: @unit_group.occupancy_percent
    fill_in "Price", with: @unit_group.price
    fill_in "Reduced Price", with: @unit_group.reduced_price
    fill_in "Size", with: @unit_group.size
    fill_in "Standard Rate", with: @unit_group.standard_rate
    fill_in "Total Non Excluded Units Count", with: @unit_group.total_non_excluded_units_count
    fill_in "Total Units Count", with: @unit_group.total_units_count
    fill_in "Unit Type", with: @unit_group.unit_type_id
    fill_in "Width", with: @unit_group.width
    click_on "Update Unit group"

    assert_text "Unit group was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit group" do
    visit unit_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit group was successfully destroyed"
  end
end
