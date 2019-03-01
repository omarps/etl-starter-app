require "application_system_test_case"

class InvoiceableFeesTest < ApplicationSystemTestCase
  setup do
    @invoiceable_fee = invoiceable_fees(:one)
  end

  test "visiting the index" do
    visit invoiceable_fees_url
    assert_selector "h1", text: "Invoiceable Fees"
  end

  test "creating a Invoiceable fee" do
    visit invoiceable_fees_url
    click_on "New Invoiceable Fee"

    fill_in "Amount", with: @invoiceable_fee.amount
    fill_in "Description", with: @invoiceable_fee.description
    fill_in "Guid", with: @invoiceable_fee.guid
    fill_in "Kind", with: @invoiceable_fee.kind
    fill_in "Product Code", with: @invoiceable_fee.product_code
    fill_in "Required At Move In", with: @invoiceable_fee.required_at_move_in
    fill_in "Required At Transfer", with: @invoiceable_fee.required_at_transfer
    fill_in "Short Description", with: @invoiceable_fee.short_description
    fill_in "Show In Sales Center", with: @invoiceable_fee.show_in_sales_center
    fill_in "Tax Total", with: @invoiceable_fee.tax_total
    fill_in "Total", with: @invoiceable_fee.total
    click_on "Create Invoiceable fee"

    assert_text "Invoiceable fee was successfully created"
    click_on "Back"
  end

  test "updating a Invoiceable fee" do
    visit invoiceable_fees_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @invoiceable_fee.amount
    fill_in "Description", with: @invoiceable_fee.description
    fill_in "Guid", with: @invoiceable_fee.guid
    fill_in "Kind", with: @invoiceable_fee.kind
    fill_in "Product Code", with: @invoiceable_fee.product_code
    fill_in "Required At Move In", with: @invoiceable_fee.required_at_move_in
    fill_in "Required At Transfer", with: @invoiceable_fee.required_at_transfer
    fill_in "Short Description", with: @invoiceable_fee.short_description
    fill_in "Show In Sales Center", with: @invoiceable_fee.show_in_sales_center
    fill_in "Tax Total", with: @invoiceable_fee.tax_total
    fill_in "Total", with: @invoiceable_fee.total
    click_on "Update Invoiceable fee"

    assert_text "Invoiceable fee was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoiceable fee" do
    visit invoiceable_fees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoiceable fee was successfully destroyed"
  end
end
