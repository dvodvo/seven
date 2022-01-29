require "application_system_test_case"

class ArticlephotosTest < ApplicationSystemTestCase
  setup do
    @articlephoto = articlephotos(:one)
  end

  test "visiting the index" do
    visit articlephotos_url
    assert_selector "h1", text: "Articlephotos"
  end

  test "should create articlephoto" do
    visit articlephotos_url
    click_on "New articlephoto"

    fill_in "Name", with: @articlephoto.name
    fill_in "Sequence", with: @articlephoto.sequence
    click_on "Create Articlephoto"

    assert_text "Articlephoto was successfully created"
    click_on "Back"
  end

  test "should update Articlephoto" do
    visit articlephoto_url(@articlephoto)
    click_on "Edit this articlephoto", match: :first

    fill_in "Name", with: @articlephoto.name
    fill_in "Sequence", with: @articlephoto.sequence
    click_on "Update Articlephoto"

    assert_text "Articlephoto was successfully updated"
    click_on "Back"
  end

  test "should destroy Articlephoto" do
    visit articlephoto_url(@articlephoto)
    click_on "Destroy this articlephoto", match: :first

    assert_text "Articlephoto was successfully destroyed"
  end
end
