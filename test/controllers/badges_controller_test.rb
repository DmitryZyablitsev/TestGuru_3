require "test_helper"

class BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badges_index_url
    assert_response :success
  end

  test "should get show" do
    get badges_show_url
    assert_response :success
  end

  test "should get edit" do
    get badges_edit_url
    assert_response :success
  end

  test "should get update" do
    get badges_update_url
    assert_response :success
  end

  test "should get delete" do
    get badges_delete_url
    assert_response :success
  end

  test "should get create" do
    get badges_create_url
    assert_response :success
  end
end
