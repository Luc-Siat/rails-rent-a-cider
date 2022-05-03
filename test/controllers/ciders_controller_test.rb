require "test_helper"

class CidersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ciders_create_url
    assert_response :success
  end

  test "should get new" do
    get ciders_new_url
    assert_response :success
  end

  test "should get show" do
    get ciders_show_url
    assert_response :success
  end
  test "should get index" do
    get ciders_index_url
    assert_response :success
  end

  test "should get destroy" do
    get ciders_destroy_url
    assert_response :success
  end

  test "should get update" do
    get ciders_update_url
    assert_response :success
  end

  test "should get show" do
    get ciders_show_url
    assert_response :success
  end
end
