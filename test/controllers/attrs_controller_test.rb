require "test_helper"

class AttrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attr = attrs(:one)
  end

  test "should get index" do
    get attrs_url
    assert_response :success
  end

  test "should get new" do
    get new_attr_url
    assert_response :success
  end

  test "should create attr" do
    assert_difference("Attr.count") do
      post attrs_url, params: { attr: { attr_title: @attr.attr_title } }
    end

    assert_redirected_to attr_url(Attr.last)
  end

  test "should show attr" do
    get attr_url(@attr)
    assert_response :success
  end

  test "should get edit" do
    get edit_attr_url(@attr)
    assert_response :success
  end

  test "should update attr" do
    patch attr_url(@attr), params: { attr: { attr_title: @attr.attr_title } }
    assert_redirected_to attr_url(@attr)
  end

  test "should destroy attr" do
    assert_difference("Attr.count", -1) do
      delete attr_url(@attr)
    end

    assert_redirected_to attrs_url
  end
end
