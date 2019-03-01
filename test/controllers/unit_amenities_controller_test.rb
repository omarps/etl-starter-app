require 'test_helper'

class UnitAmenitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_amenity = unit_amenities(:one)
  end

  test "should get index" do
    get unit_amenities_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_amenity_url
    assert_response :success
  end

  test "should create unit_amenity" do
    assert_difference('UnitAmenity.count') do
      post unit_amenities_url, params: { unit_amenity: { guid: @unit_amenity.guid, name: @unit_amenity.name, short_code: @unit_amenity.short_code, show_in_sales_center_filter_dropdown: @unit_amenity.show_in_sales_center_filter_dropdown } }
    end

    assert_redirected_to unit_amenity_url(UnitAmenity.last)
  end

  test "should show unit_amenity" do
    get unit_amenity_url(@unit_amenity)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_amenity_url(@unit_amenity)
    assert_response :success
  end

  test "should update unit_amenity" do
    patch unit_amenity_url(@unit_amenity), params: { unit_amenity: { guid: @unit_amenity.guid, name: @unit_amenity.name, short_code: @unit_amenity.short_code, show_in_sales_center_filter_dropdown: @unit_amenity.show_in_sales_center_filter_dropdown } }
    assert_redirected_to unit_amenity_url(@unit_amenity)
  end

  test "should destroy unit_amenity" do
    assert_difference('UnitAmenity.count', -1) do
      delete unit_amenity_url(@unit_amenity)
    end

    assert_redirected_to unit_amenities_url
  end
end
