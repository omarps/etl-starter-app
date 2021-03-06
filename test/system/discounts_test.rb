require "application_system_test_case"

class DiscountsTest < ApplicationSystemTestCase
  setup do
    @discount = discounts(:one)
  end

  test "visiting the index" do
    visit discounts_url
    assert_selector "h1", text: "Discounts"
  end

  test "creating a Discount" do
    visit discounts_url
    click_on "New Discount"

    fill_in "Amount", with: @discount.amount
    fill_in "Discount Type", with: @discount.discount_type
    fill_in "Guid", with: @discount.guid
    fill_in "Maximum Amount", with: @discount.maximum_amount
    fill_in "Minimum Amount", with: @discount.minimum_amount
    fill_in "Month Number", with: @discount.month_number
    click_on "Create Discount"

    assert_text "Discount was successfully created"
    click_on "Back"
  end

  test "updating a Discount" do
    visit discounts_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @discount.amount
    fill_in "Discount Type", with: @discount.discount_type
    fill_in "Guid", with: @discount.guid
    fill_in "Maximum Amount", with: @discount.maximum_amount
    fill_in "Minimum Amount", with: @discount.minimum_amount
    fill_in "Month Number", with: @discount.month_number
    click_on "Update Discount"

    assert_text "Discount was successfully updated"
    click_on "Back"
  end

  test "destroying a Discount" do
    visit discounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Discount was successfully destroyed"
  end
end
