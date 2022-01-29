require "test_helper"

class ArticlephotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articlephoto = articlephotos(:one)
  end

  test "should get index" do
    get articlephotos_url
    assert_response :success
  end

  test "should get new" do
    get new_articlephoto_url
    assert_response :success
  end

  test "should create articlephoto" do
    assert_difference("Articlephoto.count") do
      post articlephotos_url, params: { articlephoto: { name: @articlephoto.name, sequence: @articlephoto.sequence } }
    end

    assert_redirected_to articlephoto_url(Articlephoto.last)
  end

  test "should show articlephoto" do
    get articlephoto_url(@articlephoto)
    assert_response :success
  end

  test "should get edit" do
    get edit_articlephoto_url(@articlephoto)
    assert_response :success
  end

  test "should update articlephoto" do
    patch articlephoto_url(@articlephoto), params: { articlephoto: { name: @articlephoto.name, sequence: @articlephoto.sequence } }
    assert_redirected_to articlephoto_url(@articlephoto)
  end

  test "should destroy articlephoto" do
    assert_difference("Articlephoto.count", -1) do
      delete articlephoto_url(@articlephoto)
    end

    assert_redirected_to articlephotos_url
  end
end
