require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:one)
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "should create article" do
    visit articles_url
    click_on "New article"

    fill_in "Centralcode", with: @article.centralcode
    fill_in "Description categori text", with: @article.description_categori_text
    fill_in "Description search", with: @article.description_search
    fill_in "Description short", with: @article.description_short
    fill_in "Image uri", with: @article.image_uri
    fill_in "Sell price", with: @article.sell_price
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "should update Article" do
    visit article_url(@article)
    click_on "Edit this article", match: :first

    fill_in "Centralcode", with: @article.centralcode
    fill_in "Description categori text", with: @article.description_categori_text
    fill_in "Description search", with: @article.description_search
    fill_in "Description short", with: @article.description_short
    fill_in "Image uri", with: @article.image_uri
    fill_in "Sell price", with: @article.sell_price
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "should destroy Article" do
    visit article_url(@article)
    click_on "Destroy this article", match: :first

    assert_text "Article was successfully destroyed"
  end
end
