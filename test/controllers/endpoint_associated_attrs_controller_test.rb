require "test_helper"

class EndpointAssociatedAttrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @endpoint_associated_attr = endpoint_associated_attrs(:one)
  end

  test "should get index" do
    get endpoint_associated_attrs_url
    assert_response :success
  end

  test "should get new" do
    get new_endpoint_associated_attr_url
    assert_response :success
  end

  test "should create endpoint_associated_attr" do
    assert_difference("EndpointAssociatedAttr.count") do
      post endpoint_associated_attrs_url, params: { endpoint_associated_attr: { associated_product_info: @endpoint_associated_attr.associated_product_info, associated_ui_info: @endpoint_associated_attr.associated_ui_info, attr_create_request: @endpoint_associated_attr.attr_create_request, attr_create_response: @endpoint_associated_attr.attr_create_response, attr_delete_request: @endpoint_associated_attr.attr_delete_request, attr_delete_response: @endpoint_associated_attr.attr_delete_response, attr_id: @endpoint_associated_attr.attr_id, attr_index_request: @endpoint_associated_attr.attr_index_request, attr_index_response: @endpoint_associated_attr.attr_index_response, attr_show_request: @endpoint_associated_attr.attr_show_request, attr_show_response: @endpoint_associated_attr.attr_show_response, attr_type: @endpoint_associated_attr.attr_type, attr_update_request: @endpoint_associated_attr.attr_update_request, attr_update_response: @endpoint_associated_attr.attr_update_response, endpoint_create: @endpoint_associated_attr.endpoint_create, endpoint_delete: @endpoint_associated_attr.endpoint_delete, endpoint_id: @endpoint_associated_attr.endpoint_id, endpoint_index: @endpoint_associated_attr.endpoint_index, endpoint_show: @endpoint_associated_attr.endpoint_show, endpoint_update: @endpoint_associated_attr.endpoint_update } }
    end

    assert_redirected_to endpoint_associated_attr_url(EndpointAssociatedAttr.last)
  end

  test "should show endpoint_associated_attr" do
    get endpoint_associated_attr_url(@endpoint_associated_attr)
    assert_response :success
  end

  test "should get edit" do
    get edit_endpoint_associated_attr_url(@endpoint_associated_attr)
    assert_response :success
  end

  test "should update endpoint_associated_attr" do
    patch endpoint_associated_attr_url(@endpoint_associated_attr), params: { endpoint_associated_attr: { associated_product_info: @endpoint_associated_attr.associated_product_info, associated_ui_info: @endpoint_associated_attr.associated_ui_info, attr_create_request: @endpoint_associated_attr.attr_create_request, attr_create_response: @endpoint_associated_attr.attr_create_response, attr_delete_request: @endpoint_associated_attr.attr_delete_request, attr_delete_response: @endpoint_associated_attr.attr_delete_response, attr_id: @endpoint_associated_attr.attr_id, attr_index_request: @endpoint_associated_attr.attr_index_request, attr_index_response: @endpoint_associated_attr.attr_index_response, attr_show_request: @endpoint_associated_attr.attr_show_request, attr_show_response: @endpoint_associated_attr.attr_show_response, attr_type: @endpoint_associated_attr.attr_type, attr_update_request: @endpoint_associated_attr.attr_update_request, attr_update_response: @endpoint_associated_attr.attr_update_response, endpoint_create: @endpoint_associated_attr.endpoint_create, endpoint_delete: @endpoint_associated_attr.endpoint_delete, endpoint_id: @endpoint_associated_attr.endpoint_id, endpoint_index: @endpoint_associated_attr.endpoint_index, endpoint_show: @endpoint_associated_attr.endpoint_show, endpoint_update: @endpoint_associated_attr.endpoint_update } }
    assert_redirected_to endpoint_associated_attr_url(@endpoint_associated_attr)
  end

  test "should destroy endpoint_associated_attr" do
    assert_difference("EndpointAssociatedAttr.count", -1) do
      delete endpoint_associated_attr_url(@endpoint_associated_attr)
    end

    assert_redirected_to endpoint_associated_attrs_url
  end
end
