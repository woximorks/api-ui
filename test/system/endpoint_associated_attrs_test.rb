require "application_system_test_case"

class EndpointAssociatedAttrsTest < ApplicationSystemTestCase
  setup do
    @endpoint_associated_attr = endpoint_associated_attrs(:one)
  end

  test "visiting the index" do
    visit endpoint_associated_attrs_url
    assert_selector "h1", text: "Endpoint associated attrs"
  end

  test "should create endpoint associated attr" do
    visit endpoint_associated_attrs_url
    click_on "New endpoint associated attr"

    fill_in "Associated product info", with: @endpoint_associated_attr.associated_product_info
    fill_in "Associated ui info", with: @endpoint_associated_attr.associated_ui_info
    check "Attr create request" if @endpoint_associated_attr.attr_create_request
    check "Attr create response" if @endpoint_associated_attr.attr_create_response
    check "Attr delete request" if @endpoint_associated_attr.attr_delete_request
    check "Attr delete response" if @endpoint_associated_attr.attr_delete_response
    fill_in "Attr", with: @endpoint_associated_attr.attr_id
    check "Attr index request" if @endpoint_associated_attr.attr_index_request
    check "Attr index response" if @endpoint_associated_attr.attr_index_response
    check "Attr show request" if @endpoint_associated_attr.attr_show_request
    check "Attr show response" if @endpoint_associated_attr.attr_show_response
    fill_in "Attr type", with: @endpoint_associated_attr.attr_type
    check "Attr update request" if @endpoint_associated_attr.attr_update_request
    check "Attr update response" if @endpoint_associated_attr.attr_update_response
    check "Endpoint create" if @endpoint_associated_attr.endpoint_create
    check "Endpoint delete" if @endpoint_associated_attr.endpoint_delete
    fill_in "Endpoint", with: @endpoint_associated_attr.endpoint_id
    check "Endpoint index" if @endpoint_associated_attr.endpoint_index
    check "Endpoint show" if @endpoint_associated_attr.endpoint_show
    check "Endpoint update" if @endpoint_associated_attr.endpoint_update
    click_on "Create Endpoint associated attr"

    assert_text "Endpoint associated attr was successfully created"
    click_on "Back"
  end

  test "should update Endpoint associated attr" do
    visit endpoint_associated_attr_url(@endpoint_associated_attr)
    click_on "Edit this endpoint associated attr", match: :first

    fill_in "Associated product info", with: @endpoint_associated_attr.associated_product_info
    fill_in "Associated ui info", with: @endpoint_associated_attr.associated_ui_info
    check "Attr create request" if @endpoint_associated_attr.attr_create_request
    check "Attr create response" if @endpoint_associated_attr.attr_create_response
    check "Attr delete request" if @endpoint_associated_attr.attr_delete_request
    check "Attr delete response" if @endpoint_associated_attr.attr_delete_response
    fill_in "Attr", with: @endpoint_associated_attr.attr_id
    check "Attr index request" if @endpoint_associated_attr.attr_index_request
    check "Attr index response" if @endpoint_associated_attr.attr_index_response
    check "Attr show request" if @endpoint_associated_attr.attr_show_request
    check "Attr show response" if @endpoint_associated_attr.attr_show_response
    fill_in "Attr type", with: @endpoint_associated_attr.attr_type
    check "Attr update request" if @endpoint_associated_attr.attr_update_request
    check "Attr update response" if @endpoint_associated_attr.attr_update_response
    check "Endpoint create" if @endpoint_associated_attr.endpoint_create
    check "Endpoint delete" if @endpoint_associated_attr.endpoint_delete
    fill_in "Endpoint", with: @endpoint_associated_attr.endpoint_id
    check "Endpoint index" if @endpoint_associated_attr.endpoint_index
    check "Endpoint show" if @endpoint_associated_attr.endpoint_show
    check "Endpoint update" if @endpoint_associated_attr.endpoint_update
    click_on "Update Endpoint associated attr"

    assert_text "Endpoint associated attr was successfully updated"
    click_on "Back"
  end

  test "should destroy Endpoint associated attr" do
    visit endpoint_associated_attr_url(@endpoint_associated_attr)
    click_on "Destroy this endpoint associated attr", match: :first

    assert_text "Endpoint associated attr was successfully destroyed"
  end
end
