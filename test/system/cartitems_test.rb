require "application_system_test_case"

class CartitemsTest < ApplicationSystemTestCase
  setup do
    @cartitem = cartitems(:one)
  end

  test "visiting the index" do
    visit cartitems_url
    assert_selector "h1", text: "Cartitems"
  end

  test "should create cartitem" do
    visit cartitems_url
    click_on "New cartitem"

    fill_in "Article", with: @cartitem.article_id
    fill_in "Cart", with: @cartitem.cart_id
    check "Fulfilled" if @cartitem.fulfilled
    fill_in "Price ordered", with: @cartitem.price_ordered
    fill_in "Quantity ordered", with: @cartitem.quantity_ordered
    fill_in "Quantity prepared", with: @cartitem.quantity_prepared
    click_on "Create Cartitem"

    assert_text "Cartitem was successfully created"
    click_on "Back"
  end

  test "should update Cartitem" do
    visit cartitem_url(@cartitem)
    click_on "Edit this cartitem", match: :first

    fill_in "Article", with: @cartitem.article_id
    fill_in "Cart", with: @cartitem.cart_id
    check "Fulfilled" if @cartitem.fulfilled
    fill_in "Price ordered", with: @cartitem.price_ordered
    fill_in "Quantity ordered", with: @cartitem.quantity_ordered
    fill_in "Quantity prepared", with: @cartitem.quantity_prepared
    click_on "Update Cartitem"

    assert_text "Cartitem was successfully updated"
    click_on "Back"
  end

  test "should destroy Cartitem" do
    visit cartitem_url(@cartitem)
    click_on "Destroy this cartitem", match: :first

    assert_text "Cartitem was successfully destroyed"
  end
end
