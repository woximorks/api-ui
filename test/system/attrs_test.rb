require "application_system_test_case"

class AttrsTest < ApplicationSystemTestCase
  setup do
    @attr = attrs(:one)
  end

  test "visiting the index" do
    visit attrs_url
    assert_selector "h1", text: "Attrs"
  end

  test "should create attr" do
    visit attrs_url
    click_on "New attr"

    fill_in "Attr title", with: @attr.attr_title
    click_on "Create Attr"

    assert_text "Attr was successfully created"
    click_on "Back"
  end

  test "should update Attr" do
    visit attr_url(@attr)
    click_on "Edit this attr", match: :first

    fill_in "Attr title", with: @attr.attr_title
    click_on "Update Attr"

    assert_text "Attr was successfully updated"
    click_on "Back"
  end

  test "should destroy Attr" do
    visit attr_url(@attr)
    click_on "Destroy this attr", match: :first

    assert_text "Attr was successfully destroyed"
  end
end
