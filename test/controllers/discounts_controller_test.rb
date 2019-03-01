require 'test_helper'

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount = discounts(:one)
  end

  test "should get index" do
    get discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_url
    assert_response :success
  end

  test "should create discount" do
    assert_difference('Discount.count') do
      post discounts_url, params: { discount: { amount: @discount.amount, discount_type: @discount.discount_type, guid: @discount.guid, maximum_amount: @discount.maximum_amount, minimum_amount: @discount.minimum_amount, month_number: @discount.month_number } }
    end

    assert_redirected_to discount_url(Discount.last)
  end

  test "should show discount" do
    get discount_url(@discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_discount_url(@discount)
    assert_response :success
  end

  test "should update discount" do
    patch discount_url(@discount), params: { discount: { amount: @discount.amount, discount_type: @discount.discount_type, guid: @discount.guid, maximum_amount: @discount.maximum_amount, minimum_amount: @discount.minimum_amount, month_number: @discount.month_number } }
    assert_redirected_to discount_url(@discount)
  end

  test "should destroy discount" do
    assert_difference('Discount.count', -1) do
      delete discount_url(@discount)
    end

    assert_redirected_to discounts_url
  end
end
