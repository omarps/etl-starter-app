require "application_system_test_case"

class UnitsTest < ApplicationSystemTestCase
  setup do
    @unit = units(:one)
  end

  test "visiting the index" do
    visit units_url
    assert_selector "h1", text: "Units"
  end

  test "creating a Unit" do
    visit units_url
    click_on "New Unit"

    fill_in "Access Type", with: @unit.access_type
    fill_in "Area", with: @unit.area
    fill_in "Attribute Description", with: @unit.attribute_description
    fill_in "Available For Move In", with: @unit.available_for_move_in
    fill_in "Combination Lock Number", with: @unit.combination_lock_number
    fill_in "Complimentary", with: @unit.complimentary
    fill_in "Current Ledger Guid", with: @unit.current_ledger_guid
    fill_in "Current Tenant Guid", with: @unit.current_tenant_guid
    fill_in "Damaged", with: @unit.damaged
    fill_in "Deleted", with: @unit.deleted
    fill_in "Description", with: @unit.description
    fill_in "Door Height", with: @unit.door_height
    fill_in "Door Type", with: @unit.door_type
    fill_in "Door Width", with: @unit.door_width
    fill_in "Floor", with: @unit.floor
    fill_in "Height", with: @unit.height
    fill_in "Length", with: @unit.length
    fill_in "Managed Rate", with: @unit.managed_rate
    fill_in "Name", with: @unit.name
    fill_in "Payment Status", with: @unit.payment_status
    fill_in "Price", with: @unit.price
    fill_in "Rentable", with: @unit.rentable
    fill_in "Size", with: @unit.size
    fill_in "Standard Rate", with: @unit.standard_rate
    fill_in "Status", with: @unit.status
    fill_in "Unit Group", with: @unit.unit_group_id
    fill_in "Uom", with: @unit.uom
    fill_in "Width", with: @unit.width
    click_on "Create Unit"

    assert_text "Unit was successfully created"
    click_on "Back"
  end

  test "updating a Unit" do
    visit units_url
    click_on "Edit", match: :first

    fill_in "Access Type", with: @unit.access_type
    fill_in "Area", with: @unit.area
    fill_in "Attribute Description", with: @unit.attribute_description
    fill_in "Available For Move In", with: @unit.available_for_move_in
    fill_in "Combination Lock Number", with: @unit.combination_lock_number
    fill_in "Complimentary", with: @unit.complimentary
    fill_in "Current Ledger Guid", with: @unit.current_ledger_guid
    fill_in "Current Tenant Guid", with: @unit.current_tenant_guid
    fill_in "Damaged", with: @unit.damaged
    fill_in "Deleted", with: @unit.deleted
    fill_in "Description", with: @unit.description
    fill_in "Door Height", with: @unit.door_height
    fill_in "Door Type", with: @unit.door_type
    fill_in "Door Width", with: @unit.door_width
    fill_in "Floor", with: @unit.floor
    fill_in "Height", with: @unit.height
    fill_in "Length", with: @unit.length
    fill_in "Managed Rate", with: @unit.managed_rate
    fill_in "Name", with: @unit.name
    fill_in "Payment Status", with: @unit.payment_status
    fill_in "Price", with: @unit.price
    fill_in "Rentable", with: @unit.rentable
    fill_in "Size", with: @unit.size
    fill_in "Standard Rate", with: @unit.standard_rate
    fill_in "Status", with: @unit.status
    fill_in "Unit Group", with: @unit.unit_group_id
    fill_in "Uom", with: @unit.uom
    fill_in "Width", with: @unit.width
    click_on "Update Unit"

    assert_text "Unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit" do
    visit units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit was successfully destroyed"
  end
end
