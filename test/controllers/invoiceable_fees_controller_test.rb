require 'test_helper'

class InvoiceableFeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoiceable_fee = invoiceable_fees(:one)
  end

  test "should get index" do
    get invoiceable_fees_url
    assert_response :success
  end

  test "should get new" do
    get new_invoiceable_fee_url
    assert_response :success
  end

  test "should create invoiceable_fee" do
    assert_difference('InvoiceableFee.count') do
      post invoiceable_fees_url, params: { invoiceable_fee: { amount: @invoiceable_fee.amount, description: @invoiceable_fee.description, guid: @invoiceable_fee.guid, kind: @invoiceable_fee.kind, product_code: @invoiceable_fee.product_code, required_at_move_in: @invoiceable_fee.required_at_move_in, required_at_transfer: @invoiceable_fee.required_at_transfer, short_description: @invoiceable_fee.short_description, show_in_sales_center: @invoiceable_fee.show_in_sales_center, tax_total: @invoiceable_fee.tax_total, total: @invoiceable_fee.total } }
    end

    assert_redirected_to invoiceable_fee_url(InvoiceableFee.last)
  end

  test "should show invoiceable_fee" do
    get invoiceable_fee_url(@invoiceable_fee)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoiceable_fee_url(@invoiceable_fee)
    assert_response :success
  end

  test "should update invoiceable_fee" do
    patch invoiceable_fee_url(@invoiceable_fee), params: { invoiceable_fee: { amount: @invoiceable_fee.amount, description: @invoiceable_fee.description, guid: @invoiceable_fee.guid, kind: @invoiceable_fee.kind, product_code: @invoiceable_fee.product_code, required_at_move_in: @invoiceable_fee.required_at_move_in, required_at_transfer: @invoiceable_fee.required_at_transfer, short_description: @invoiceable_fee.short_description, show_in_sales_center: @invoiceable_fee.show_in_sales_center, tax_total: @invoiceable_fee.tax_total, total: @invoiceable_fee.total } }
    assert_redirected_to invoiceable_fee_url(@invoiceable_fee)
  end

  test "should destroy invoiceable_fee" do
    assert_difference('InvoiceableFee.count', -1) do
      delete invoiceable_fee_url(@invoiceable_fee)
    end

    assert_redirected_to invoiceable_fees_url
  end
end
